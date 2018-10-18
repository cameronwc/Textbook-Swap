class TextbookWishlistController < ApplicationController
  def index
    @wishlistBooks_Final = []
    @current_user = session['user_id']

    @wishlistBooks = Wishlist.where(:user_id => session['user_id'])
    @wishlistBooks.each do |wishlistBook|
      @Bookinfo = Book.where(:id => wishlistBook.book_id)
      @wishlistBooks_Final.push(@Bookinfo[0])
    end
  end

  def create
    @wishlistCheck = Wishlist.where(:user_id => params['user_id'], :book_id => params['book_id'])
    if(@wishlistCheck.length == 0)
      @new_wishlist = Wishlist.create(:user_id => params['user_id'], :book_id => params['book_id'])
    end
    redirect_to "/"
  end

  def destroy
    @wishlist = Wishlist.where(:user_id => params['user_id'], :book_id => params['book_id'])
    @wishlist[0].destroy
    redirect_to '/textbook_wishlist'
  end
end
