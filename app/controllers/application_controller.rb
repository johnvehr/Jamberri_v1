class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def set_time_zone
    Time.zone = current_user.time_zone
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username << :avatar
  end

end
