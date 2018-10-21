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
      if @createdBook.valid?
        @createdBook.seller = @current_user
        @createdBook.save!
        @current_user.books << @createdBook
      else
        flash.alert = "Error please check your fields."
        redirect_to "/add_book"
      end
      #@current_user.save!
    else
      p "please login"
      redirect_to "/login"
    end
  end

  def similar
    @returnedBooks = Book.where(:isbn => params['isbn']).limit(params['limit'])
    puts @returnedBooks
    render :json => @returnedBooks.to_json
  end
end
