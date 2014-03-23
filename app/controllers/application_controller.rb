class ApplicationController < ActionController::Base
  before_action :authenticate
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    
    def authenticate
      unless User.find_by(id: session[:user_id])
        redirect_to login_path, notice: "Please login"
      end
    end
end
