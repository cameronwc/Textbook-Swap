class HomeController < ApplicationController
  def index
    @allBooks = Book.all.limit(4)
    if logged_in?
        @username = @current_user.name
        @LogInOrOut = "Logout, " + String(@username)
    else
        @LogInOrOut = "Login"
    end
  end
end
