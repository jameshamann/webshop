class ApplicationController < ActionController::Base
  #
  # rescue_from CanCan::AccessDenied do |exception|
  #     respond_to do |format|
  #       format.json { head :forbidden, content_type: 'text/html' }
  #       format.html { redirect_to main_app.root_url, notice: exception.message }
  #       format.js   { head :forbidden, content_type: 'text/html' }
  #     end
  #   end

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:index]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
   end

  # def after_sign_in_path_for(resource)
  #     app_dashboard_index_path
  # end
end
