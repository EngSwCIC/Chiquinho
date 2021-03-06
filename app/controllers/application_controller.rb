class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :update_resource, if: :devise_controller?
  # before_action :after_update_path_for, if: :devise_controller?
  #protect_from_forgery
  include ApplicationHelper
  before_action :set_current_user

  def set_current_user
    Comment.current_user = current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:matricula,:course_id])
  end


  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
