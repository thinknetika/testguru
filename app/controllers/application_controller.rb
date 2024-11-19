class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :admin?

  def admin?
    current_user.is_a?(Admin)
  end

  def default_url_options(options={})
    { locale: ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[ first_name last_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[ first_name last_name ])
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
