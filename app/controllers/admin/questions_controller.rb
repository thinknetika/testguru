class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: [ :show, :edit, :update, :destroy ]
  before_action :set_test, only: [ :new, :create ]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_path(@question.test), status: :see_other
    else
      render :new, status: 422
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
    else
      render :edit, status: 422
    end
  end

  def destroy
    @question.destroy

    redirect_to admin_test_path(@question.test), status: :see_other
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
