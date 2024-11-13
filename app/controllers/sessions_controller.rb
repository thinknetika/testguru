class SessionsController  < Devise::SessionsController
  def create
    super
    flash[:notice] = "Welcome, #{current_user.first_name} #{current_user.last_name}!" if current_user.names_present?
  end
end
