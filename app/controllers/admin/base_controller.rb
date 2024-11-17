class Admin::BaseController < ApplicationController
  layout "admin/layouts/admin"

  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: t("admin.base.not_authorized") unless current_user.is_a?(Admin)
  end
end
