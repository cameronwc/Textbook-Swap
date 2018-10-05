class LoginController < ApplicationController
    def create
        p params
        @user = Account.new(:name => params[:name], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
        if @user.valid?
           @user.save
        else
           p "ERROR-------------------------------------------------"
        end
    end
    def check
        p params
        @user = Account.find_by(email: params[:user_email].downcase)
        if @user.nil?
            p "Account does not exist"
        else
            if @user.authenticate(params[:user_password])
                p "correct Password"
            else
                p "password incorrect"
            end
        end
    end
    def index
        
    end
end