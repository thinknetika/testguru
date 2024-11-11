class Admin::TestController < Admin::BaseController
  before_action :set_test, only: [ :show, :edit, :update, :destroy, :start ]

  def start
    @user = User.first

    current_user.tests.push(@test)

    redirect_to current_user.test_passage(@test)
  end

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to test_path(@test), status: :see_other
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to test_path(@test), status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  private
  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
