class SearchBookController < ApplicationController
  def index

	@found_books = Book.find_books(params["search_text"],params["search_university"])
	text = params["search_text"]
	university = params["search_university"]

	if(@found_books.nil?)
		@found_num = 0
	else
		@found_num = @found_books.length
	end
	
	  @message = "#{@found_num} books were found"

	  if(text != "")
		  @message = "#{@message} for search '#{text}'"
	  end
	  if(university != "")
		  @message = "#{@message} at university '#{university}'"
	  end	  
  end
end
