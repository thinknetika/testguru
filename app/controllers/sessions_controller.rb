class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to cookies[:current_url] || root_path, status: :see_other
    else
      flash.now[:alert] = "Are you a Guru? Verify your email or password"

      render :new, status: :unprocessable_content
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Logout success"
    redirect_to login_path, status: :see_other
  end
end
