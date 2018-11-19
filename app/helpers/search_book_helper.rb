
#Helpers for the search book controller

module SearchBookHelper

	#Sets the message to print in the search view based on search parameters.
	def set_message(number, search_text, search_university)
		message = set_num_message(number)
		if(search_text != "")
			message = "#{message} for search '#{search_text}'"
		end
		if(search_university != "")
			message = "#{message} at university '#{search_university}'"
		end
		return message
	end

	#Grammar helper for message depending on number of books found
	def set_num_message(number)
		if(number == 1)
			message = "1 book found"
		else
			message = "#{number} books found"
		end
		return message
	end

end
