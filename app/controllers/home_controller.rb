class HomeController < ApplicationController
  def index
    @allBooks = Book.all.limit(4)
  end
end
