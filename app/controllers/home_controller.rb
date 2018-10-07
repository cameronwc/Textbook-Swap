class HomeController < ApplicationController
  def index
    @message = "test"
    #@current_user = current_user
    if logged_in?
      @LogInOrOut = "Logout, " + String(@current_user.name)
    else
      p "login"
      @LogInOrOut = "Login"

  end
  end
end
