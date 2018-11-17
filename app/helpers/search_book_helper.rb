module SearchBookHelper

	#Sets the message to print in the search view based on search parameters.
	def set_message(number, search_text, search_university)
		if(number == 1)
			message = "1 book found"
		else
			message = "#{number} books found"
		end
		if(search_text != "")
			message = "#{message} for search '#{search_text}'"
		end
		if(search_university != "")
			message = "#{message} at university '#{search_university}'"
		end
		return message
	end
end
