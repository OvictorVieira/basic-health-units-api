class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User, except: [:login]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cnpj])
  end
end
