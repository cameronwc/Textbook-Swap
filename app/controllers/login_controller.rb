# The LoginController is responsible for account creation (create), user validation for login (check), and logout functionality (destroy)
class LoginController < ApplicationController
   #this function creates a new user in the database
    def create
        user = Account.new(:name => params[:name], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
        # @user.account_id = @user.id
        if user.valid?
            flash.notice = "Succesfully created account and logged in."
            user.save
            log_in user
            redirect_to "/"
        else
            flash.alert = "Error please check your username and password."
            redirect_to "/login"
        end
    end
    #this function either logs in a user if their login info is correct and sends an error if it is not correct
    def check
        user = Account.find_by(email: params[:user_email].downcase)
        if user.nil?
            flash.alert = "User does not exist please signup."
            redirect_to "/login"
        else
            redirect = login_compare(user,params[:user_password])
            redirect_to redirect
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
            @LogInOrOut = "Logout, " + String(current_user.name)
        else
            p "login"
            @LogInOrOut = "Login"

        end
    end
end