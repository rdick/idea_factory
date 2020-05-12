class ApplicationController < ActionController::Base
    def current_user
        if session[:user_id].present?
            @current_user ||= User.find session[:user_id]
        end
    end
    helper_method :current_user

    def user_signed_in?
        current_user.present?
    end
    helper_method :user_signed_in?

    def authenticate_user!
        unless user_signed_in?
            flash[:danger] = "Please Sign In"
            redirect_to :root
        end
    end

end
