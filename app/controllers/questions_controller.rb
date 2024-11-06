class QuestionsController < ApplicationController
  before_action :set_question, only: [ :show, :edit, :update, :destroy ]
  before_action :set_test, only: [ :new, :create ]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_question_not_found

  def show
    render plain: @question.body
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_path(@question.test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      render :edit
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
    debugger
    @question = Question.find(params[:id])
  end

  def resque_with_question_not_found
    render plain: "Question not found"
  end
end
