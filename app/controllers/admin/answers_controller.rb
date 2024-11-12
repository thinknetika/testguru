class Admin::AnswersController < Admin::BaseController
  before_action :set_answer, only: %i[ show edit update destroy ]
  before_action :set_question, only: %i[ create new ]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @answer, status: :see_other
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @answer.destroy!

    redirect_to question_answers_path(@answer.question), status: :see_other
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
