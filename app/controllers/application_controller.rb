class ApplicationController < ActionController::Base

    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            # use find_by to avoid errors when the user with id is not found
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in to access this service." if Current.user.nil?
    end
end
