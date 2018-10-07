class SearchBookController < ApplicationController
  def index
	  @text = params["search_text"]
	  @found_books = Book.where("title like '%#{@text}%' OR author like '%#{@text}%' OR isbn='#{@text}'")
	  @found_num = @found_books.length
	  @message = "#{@found_num} books were found for search '#{@text}.'"
	  
	  
  end
end
