class SearchBookController < ApplicationController
  def index
	  @text = params["search_text"]
	  @university = params["search_university"] 

	  if(@university == "")
	  	@found_books = Book.where("(LOWER(title) like LOWER('%#{@text}%') OR LOWER(author) like LOWER('%#{@text}%') OR isbn='#{@text}')")
	  else
		  @found_books = Book.joins(:seller).where("(LOWER(title) like LOWER('%#{@text}%') OR LOWER(author) like LOWER('%#{@text}%') OR isbn='#{@text}') AND (LOWER(email) like LOWER('%@#{@university}.edu'))")
	  end

	  @found_num = @found_books.length
	  @message = "#{@found_num} books were found"

	  if(@text != "")
		  @message = "#{@message} for search '#{@text}'"
	  end
	  if(@university != "")
		  @message = "#{@message} at university '#{@university}'"
	  end

  end
end
