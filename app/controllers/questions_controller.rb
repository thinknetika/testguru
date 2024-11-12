class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_question_not_found

  def show
    @question = Question.find(params[:id])
  end

  private

  def resque_with_question_not_found
    render plain: "Question not found"
  end
end
