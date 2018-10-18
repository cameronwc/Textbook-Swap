class DashboardController < ApplicationController
  def new
  end

  def index
    @wishlistBooks_Final = []
    @current_user = session['user_id']

    @wishlistBooks = Wishlist.where(:user_id => session['user_id'])
    @wishlistBooks.each do |wishlistBook|
      @Bookinfo = Book.where(:id => wishlistBook.book_id)
      @wishlistBooks_Final.push(@Bookinfo[0])
    end
  end
end
