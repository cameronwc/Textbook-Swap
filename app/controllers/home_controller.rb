class HomeController < ApplicationController
  def index
    @allBooks = Book.all.limit(4)
    puts @allBooks._id
    if logged_in?
      @LogInOrOut = "Logout, " + String(@current_user.name)
    else
      @LogInOrOut = "Login"
    end
  end
end
