class ApplicationController < ActionController::Base
  # Configuración de parámetros permitidos para Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :age, :gender, :weight, :height])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :age, :gender, :weight, :height])
  end
end
