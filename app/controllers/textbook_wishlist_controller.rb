class TextbookWishlistController < ApplicationController
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

  def contact_info
    @contact_book = Book.where(:isbn => params['book_isbn'])
    @seller = Account.where(:id => params['seller_id'])
    p "-------seller---------"
    p @seller
    redirect_to '/dashboard'
  end
end
