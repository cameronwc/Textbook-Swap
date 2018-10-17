class AddBookController < ApplicationController
  def index
    if logged_in?
      @LogInOrOut = "Logout, " + String(@current_user.name)
    else
      redirect_to "/login"
    end
  end

  def create
    @createdBook = Book.create(:isbn => params['isbn'], :title => params['title'], :edition => params['edition'], :author => params['author'], :condition => params['condition'], :price => params['price'])
    @createdBook.save!
    redirect_to "/"
  end

  def similar
    @returnedBooks = Book.where(:isbn => params['isbn']).limit(params['limit'])
    puts @returnedBooks
    render :json => @returnedBooks.to_json
  end
end
