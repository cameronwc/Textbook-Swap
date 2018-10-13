class LoginController < ApplicationController
    def create
        p params
        @user = Account.new(:name => params[:name], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
        if @user.valid?
           flash.notice = "Succesfully created account and logged in."
           @user.save
           log_in @user
           redirect_to "/"
        else
            flash.alert = "Error please check your username and password."
            redirect_to "/login"
        end
    end

    def check
        # TODO(Add flash with loged in/logout message)
        p params
        user = Account.find_by(email: params[:user_email].downcase)
        if user.nil?
            flash.alert = "User does not exist please signup."
            redirect_to "/login"
        else
            if user.authenticate(params[:user_password])
                log_in user
                @current_user = current_user
                p "Correct Password"
                redirect_to "/"
            else
                flash.alert = "Error please check your username and password."
                redirect_to "/login"
            end
        end
    end

    def destroy
        # TODO(Add flash with logout message)
        reset_session
        redirect_to "/"
    end
    
    def index
        #@current_user = current_user
        if logged_in?
            @LogInOrOut = "Logout, " + String(@current_user.name)
        else
            p "login"
            @LogInOrOut = "Login"

        end
    end
end