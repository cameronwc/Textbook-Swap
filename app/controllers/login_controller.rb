class LoginController < ApplicationController
    def create
        p params
        @user = Account.new(:name => params[:Account])
        #if @user.valid?
         #  @user.save
        #else
         #   p "ERROR-------------------------------------------------"
        #end
    end
    def index
        
    end
end