class RegistrationsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account"
        else
            #render :new #new.html.erb
            #flash[:alert] = "Something went wrong"
            redirect_to sign_up_path, alert: "Something went wrong, please use valid email and password"
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end