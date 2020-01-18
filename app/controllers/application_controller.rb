class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |e|
  	render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
  end

  protected

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :dob, :agreed_tas])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :dob, :agreed_tas])
  end

  def set_account
    @account = current_user.accounts.last
  end

  def set_groups
    @groups = @account.groups
    @group = @account.current_group || @groups.first
  end
end
