class ApplicationController < ActionController::Base
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password, :birthday, :surname, :first_name, :phonetic_name1, :phonetic_name2])
  end
end
