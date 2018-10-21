class DashboardController < ApplicationController

  def new
  end

  def index
    if !logged_in?
      redirect_to "/login"
    else
      @LogInOrOut = "Logout, " + String(@current_user.name)

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
  end

  def update
    if !logged_in?
      redirect_to "/login"
    else
      @LogInOrOut = "Logout, " + String(@current_user.name)
    end

    @current_user.books.where(:id => params['book_id']).update(:selling => true);
    redirect_to "/dashboard"
  end

  def sold
    if !logged_in?
      redirect_to "/login"
    else
      @LogInOrOut = "Logout, " + String(@current_user.name)
    end
  
    @current_user.books.where(:id => params['book_id']).update(:sold => true, :selling => false);
    redirect_to "/dashboard"
  end
end
