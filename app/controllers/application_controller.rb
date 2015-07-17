class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  layout :layout_by_resource

  protected
  def after_sign_in_path_for(resource)
    dashboard_root_path
  end

  def layout_by_resource
    if devise_controller?
      "devise/application"
    else
      "application"
    end
  end

end
