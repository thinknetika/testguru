class SessionsController  < Devise::SessionsController
  def create
    super
    flash[:notice] = t("devise.sessions.welcome", first_name: current_user.first_name, last_name: current_user.last_name) if current_user.names_present?
  end
end
