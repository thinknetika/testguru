class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @result = GistQuestionService.new(@test_passage.current_question).call

    if @result.success?
      @test_passage.current_question.gist.create!(user: current_user, url: @result.url)
      flash[:notice] = t(".success")
      flash[:link] = { url: @result.url, text: "Просмотреть Gist" }
    else
      flash[:alert] = t(".failure")
    end

    redirect_to @test_passage
  end

  def gist_link(url)
    ActionController::Base.helpers.link_to(t(".result"), url, target: "_blank")
  end
end
