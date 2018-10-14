class SearchBookController < ApplicationController
  def index
	  @text = params["search_text"]
	  @found_books = Book.where("LOWER(title) like LOWER('%#{@text}%') OR LOWER(author) like LOWER('%#{@text}%') OR isbn='#{@text}'")
	  @found_num = @found_books.length
	  @message = "#{@found_num} books were found for search '#{@text}.'"
	  
	  
  end
end
