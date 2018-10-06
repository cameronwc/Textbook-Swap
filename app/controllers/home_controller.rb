class HomeController < ApplicationController
  def index
    @allBooks = Book.all
  end
end
