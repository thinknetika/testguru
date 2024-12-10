class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[ index update_inline ]
  before_action :set_test, only: %i[ show edit update destroy update_inline ]

  def index; end

  def show; end

  def new
    @test = current_user.create_tests.new
  end

  def create
    @test = current_user.create_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t("admin.tests.create.success"), status: :see_other
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: t("admin.tests.update.success"), status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path, status: :see_other
    else
      render :index, status: :unprocessable_content
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path, notice: t("admin.tests.delete.success"), status: :see_other
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :time_limit)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end
end
