class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
  # end
end
