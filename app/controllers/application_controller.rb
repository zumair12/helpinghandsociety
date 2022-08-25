class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name role])
  end

  def redirect_back_path(redirect_path, parameter = {})
    case redirect_path
    when "registered_students"
      registered_students_path
    when "students_stipend"
      students_stipend_path(parameter)
    else
      student_url(@student)      
    end
  end
end
