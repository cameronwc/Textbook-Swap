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

  end
end
