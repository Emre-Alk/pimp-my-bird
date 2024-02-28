class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:address, :email, :password)}
      # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:address, :email, :password, :current_password)}
      devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
      devise_parameter_sanitizer.permit(:account_update, keys: [:address])
  end
end
