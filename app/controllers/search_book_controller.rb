class SearchBookController < ApplicationController
  def index

  	#Get text and university fields from either params or session
	text = params["search_text"]
	university = params["search_university"]
	if(text == "" && university == "")
		text = session["search_text"]
		university = session["search_university"]
	else
		session["search_text"] = text
		session["search_university"] = university
	end

	#Query database	
	@found_books = Book.find_books(text,university)
	
	#Get number of found books
	if(@found_books.nil? || @found_books == [])
		found_num = 0
	else
		found_num = @found_books.length
	end

	#Initialize message to print in view
	@message = "#{found_num} books were found"
	if(!text.nil? && text != "")
		@message = "#{@message} for search '#{text}'"
	end
	if(!university.nil? && university != "")
		@message = "#{@message} at university '#{university}'"
	end	  

	#Sort books by filter
	filter = params["sort_filter"]
	if(!filter.nil? && filter != "")
		@found_books = Book.sort_books(filter, @found_books)
	end
  end
end
