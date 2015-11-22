class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    include SessionsHelper

    def authenticate_user
        unless logged_in?
            flash[:error] = "You need to log in."
            redirect_to login_path
        end
    end

    def redirect_logged_in_user
        if logged_in?
            flash[:error] = "You are already logged in."
            redirect_to user_profile_path(current_user)
        end
    end
end
