# The AddBookController is responsible for rendering and creating books on the site. This class also has a similar function to return similar books by isbn.
class AddBookController < ApplicationController
  before_action :login_check, :except => [:similar]

  def index
  end

  def create
    @createdBook = Book.create(:isbn => params['isbn'], :title => params['title'], :edition => params['edition'], :author => params['author'], :condition => params['condition'], :price => params['price'])
    @createdBook.seller = @current_user
    if (@createdBook.valid?)
      @createdBook.save!
      @current_user.books << @createdBook
      redirect_to "/dashboard"
    else
      flash.alert = "Please check your fields."
      redirect_to "/add_book"
    end
  end

  def similar
    @returnedBooks = Book.where(:isbn => params['isbn']).limit(params['limit'])
    render :json => @returnedBooks.to_json
  end
end

def login_check
  if !logged_in?
    redirect_to "/login"
  else
    @LogInOrOut = "Logout, " + String(@current_user.name)
  end
end

