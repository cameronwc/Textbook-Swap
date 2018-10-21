class AddBookController < ApplicationController
  def index
    if logged_in?
      @LogInOrOut = "Logout, " + String(@current_user.name)
    else
      redirect_to "/login"
    end
  end

  def create
    if logged_in?
      @createdBook = Book.create(:isbn => params['isbn'], :title => params['title'], :edition => params['edition'], :author => params['author'], :condition => params['condition'], :price => params['price'])
      @createdBook.seller = @current_user
      if (@createdBook.valid?)
        @createdBook.save!
        @current_user.books << @createdBook
      else
        flash.alert = "Error please check your fields."
        redirect_to "/add_book"
      end
    else
      p "please login"
      redirect_to "/login"
    end
  end

  def similar
    @returnedBooks = Book.where(:isbn => params['isbn']).limit(params['limit'])
    render :json => @returnedBooks.to_json
  end
end
