class TextbookWishlistController < ApplicationController
  def index
    
  end

  def create
    p params
    # @wishlist = Wishlist.new(user_id: , book_id: )
    redirect_to "/"
  end
end
