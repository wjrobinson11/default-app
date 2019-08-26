class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |e|
  	render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
  end

  protected

  def after_sign_in_path_for(resource)
    contests_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :dob, :agreed_tas])
  end
end
