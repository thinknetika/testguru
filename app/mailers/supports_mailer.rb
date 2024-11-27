class SupportsMailer < ApplicationMailer
  def send_email(contact)
    @name = contact[:name]
    @email = contact[:email]
    @message = contact[:message]
    @support_email = support_email

    mail to: @support_email
  end

  private

  def support_email
    Rails.application.credentials.support[:email]
  end
end
