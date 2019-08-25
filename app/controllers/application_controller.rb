class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :dob, :agreed_tas])
  end

  def after_sign_in_path_for(user)
  	contests_path
  end
end
