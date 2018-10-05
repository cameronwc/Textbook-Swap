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
    def index
        
    end
end