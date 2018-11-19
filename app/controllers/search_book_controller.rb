#The search/sort book controller for book searches/sorts
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
	
	#Initialize message to print in view
	@message = helpers.set_message(@found_books.length, text, university)

	#Sort books by filter
	filter = params["sort_filter"]
	if(!filter.nil?)
		@found_books = Book.sort_books(filter, @found_books)
	end
  end

end
