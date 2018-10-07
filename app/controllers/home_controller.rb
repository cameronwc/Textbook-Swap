class HomeController < ApplicationController
  def index
    @allBooks = Book.all.limit(4)
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
