class SupportsController < ApplicationController
  def new; end

  def create
    get_message_params

    if @message[:email].present?
      SupportsMailer.send_email(@message).deliver_now

      flash[:notice] = t("message.create.success")
    else
      flash[:alert] = t("message.create.error")
    end
    redirect_to root_path
  end

  private

  def get_message_params
    @message = {
      name: params[:name],
      email: params[:email],
      text: params[:text]
    }
  end
end
