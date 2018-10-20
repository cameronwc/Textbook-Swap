class SearchBookController < ApplicationController
  def index

		text = params["search_text"]
		university = params["search_university"]

	  search_book
	  found_num = @found_books.length
	
	  @message = "#{found_num} books were found"

	  if(text != "")
		  @message = "#{@message} for search '#{text}'"
	  end
	  if(university != "")
		  @message = "#{@message} at university '#{university}'"
	  end	  
  end


  def search_book
		@found_books = Book.find_books(params["search_text"],params["search_university"])
  end
end
