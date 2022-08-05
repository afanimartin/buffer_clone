class SessionsController < ApplicationController
    def new
        @user = User.new 
    end

    def create 
        # find user by their email
        # if exits, check their password against the password_digest from the database
        # if passwords match, create a new session using the user_id
        # else throw and error to the user

        @user = User.find_by(email: params[:email])

        if @user.present? && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Logged in successfully."
        else 
            flash[:alert] = "Invalid email or password."
            render :new
        end
    end

    def destroy
        session[:user_id] = nil

        redirect_to root_path, notice: "Logged out successfully."
    end
end