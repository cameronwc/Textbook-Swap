class SearchBookController < ApplicationController
  def index
	  @text = params["search_text"]
	  @found_books = Book.where("title=? OR isbn=? OR author=?, '#{@text}', '#{@text}', '#{@text}'")
	  @found_num = @found_books.length
	  if(@found_num <= 0)
		  @message = "No books were found."
	  else
		  @message = "#{@found_num} books were found."
	  end
  end
end
