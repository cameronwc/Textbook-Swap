class SearchBookController < ApplicationController
  def index

	  #Get text and university fields from either params or session
	if(params["search_text"] == "" && params["search_university"] == "")
		@text = session["search_text"]
		@university = session["search_university"]
	else
		@text = params["search_text"]
		@university = params["search_university"]
		session["search_text"] = @text
		session["search_university"] = @university
	end
	
	@found_books = Book.find_books(params["search_text"],params["search_university"])
	@filter = params["sort_filter"]

	if(@found_books.nil? || @found_books == [])
		@found_num = 0
	else
		@found_num = @found_books.length
	end
	
	  @message = "#{@found_num} books were found"

	  if(!@text.nil? && @text != "")
		  @message = "#{@message} for search '#{@text}'"
	  end
	  if(!@university.nil? && @university != "")
		  @message = "#{@message} at university '#{@university}'"
	  end	  

	  #Sort books if sort filter has been specified.
	  if(!@filter.nil? && @filter != "")
		  @found_books = Book.sort_books(@filter, @found_books)
	  end
  end
end
