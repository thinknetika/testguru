class GistQuestionService
  ACCESS_TOKEN = Rails.application.credentials.github[:access_token].freeze
  SERVER_RESPONSE = 201.freeze
  SUCCESS_STATUS_RANGE = 200..299.freeze

  GistObject = Struct.new(:url, :status_server) do
    def success?
      SUCCESS_STATUS_RANGE.include?(status_server)
    end
  end

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
    GistObject.new(@client.last_response.data[:html_url], @client.last_response.status)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def gist_params
    {
      description: I18n.t("services.gist_question.create_gist", title: @test.title),
      public: true,
      files: {
        "test-guru-question.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [ @question.body, *@question.answers.pluck(:body) ].join("\n")
  end
end
