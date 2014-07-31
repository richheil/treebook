class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ActiveModel::ForbiddenAttributesProtection
  protect_from_forgery with: :exception
  before_filter :configure_devise_params_sign_up, if: :devise_controller?

  protected

  	def configure_devise_params_sign_up
  		devise_parameter_sanitizer.for(:sign_up) do |u|
  			u.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :current_password)

  	end
  end
  before_filter :configure_devise_params_account_update, if: :devise_controller?
  protected
  	def configure_devise_params_account_update
  		devise_parameter_sanitizer.for(:account_update) do |u|
  			u.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :current_password)

  	end
  end
  

end
