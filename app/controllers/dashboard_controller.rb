# The DashboardController is responsible for rendering the dashboard, updating books from owned to selling to sold, and deleting books.
class DashboardController < ApplicationController

  before_action :login_check

  def index
      # all books
      @books = @current_user.books.all()

      # users owned books
      @ownedBooks = @books.where(:sold => false)

      # users currently selling
      @sellingBooks = @books.where(:selling => true)

      # users sold books
      @soldBooks = @books.where(:sold => true)
  
      @wishlistBooks_Final = []
  
      @wishlistBooks = Wishlist.where(:user_id => @current_user.id)
      @wishlistBooks.each do |wishlistBook|
        @Bookinfo = Book.where(:id => wishlistBook.book_id)
        @wishlistBooks_Final.push(@Bookinfo[0])
      end
  end

  def update
    @current_user.books.where(:id => params['book_id']).update(:selling => true);
    flash.alert = "Your book has been added to your selling list."
    redirect_to "/dashboard"
  end

  def destroy
    @books = @current_user.books.all()
    flash.alert = "Your book has been deleted."
    book_id = params['book_id']
    @books.where(:id => book_id).destroy(book_id)
    redirect_to "/dashboard"
  end

  def sold
    @current_user.books.where(:id => params['book_id']).update(:sold => true, :selling => false);
    redirect_to "/dashboard"
  end

end

def login_check
  if !logged_in?
    redirect_to "/login"
  else
    @LogInOrOut = "Logout, " + String(@current_user.name)
  end
end

