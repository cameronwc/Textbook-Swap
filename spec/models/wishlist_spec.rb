require 'rails_helper'

RSpec.describe Wishlist, type: :model do
    it 'should be defined' do
      @wishlist = Wishlist.new(user_id: 12, book_id: 2)
      expect(@wishlist.valid?).to be true
    end

    it 'should not be defined for a negative user id' do
      @Wishlist = Wishlist.new(user_id: -1, book_id: 1)
      expect(@wishlist.valid?).to be false
    end

    it 'should not be defined without 2 arguments' do
      @Wishlist = Wishlist.new(user_id: 1)
      expect(@wishlist.valid?).to be false
    end
end
