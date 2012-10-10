class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :devise_controller?

	rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = "Access denied."
		redirect_to root_url
	end

  def after_sign_in_path_for(resource)
   dashboard_path
  end

  def after_sign_up_path_for(resource)
   dashboard_path
  end
end
