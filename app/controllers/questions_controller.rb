class QuestionsController < ApplicationController
  before_action :set_test, only: [ :new, :index, :create ]
  before_action :set_question, only: [ :show, :destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_question_not_found

  def index
    @questions = @test.questions.map(&:body)

    render plain: @questions.join("\n")
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to test_questions_path(@test)
    else
      render plain: "Error question create"
    end
  end

  def destroy
    @question.destroy

    render plain: "Question delete success"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def resque_with_question_not_found
    render plain: "Question not found"
  end
end
