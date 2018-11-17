# The TextbookWishlistController is responsible for creating, destroying, and displaying contact info for wishlists.
class TextbookWishlistController < ApplicationController
  def create
    user_id = params['user_id'];
    book_id = params['book_id'];
    @check_for_existence = Wishlist.where(:user_id => user_id, :book_id => book_id)
    if(@check_for_existence.length == 0)
      @new_wishlist = Wishlist.create(:user_id => user_id, :book_id => book_id)
    end
    redirect_to "/"
  end

  def destroy
    @wishlist = Wishlist.where(:user_id => params['user_id'], :book_id => params['book_id'])
    @wishlist[0].destroy
    redirect_to '/dashboard'
  end

  def contact_info
    #not sure if this is useful
    @contact_book = Book.where(:isbn => params['book_isbn'])
    @seller = Account.where(:id => params['seller_id'])
    redirect_to '/dashboard'
  end

end
