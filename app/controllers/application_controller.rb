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


  # def after_sign_in_path_for(resource)
  #     app_dashboard_index_path
  # end
end
