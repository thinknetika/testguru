class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[ show edit update destroy ]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t("admin.badges.create.success"), status: :see_other
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t("admin.badges.update.success"), status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def options
    render partial: "admin/badges/options", locals: { badge_type: params[:badge_type] }
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path, notice: t("admin.badges.destroy"), status: :see_other
  end

  private
  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image, :rule_name, :rule_value)
  end
end
