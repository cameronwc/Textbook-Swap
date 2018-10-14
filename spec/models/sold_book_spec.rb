require 'rails_helper'

RSpec.describe SoldBook, type: :model do

  before(:each) do
    @grinch_book = Book.new(isbn: "1665544332211", title: "Grinch Stole Christmas", edition: "12th", condition: "new", price: 100, author: "Seuss", seller_id: 2, buyer_id: 1).save
    @physics_book = Book.new(isbn: "1234567891234", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo", seller_id: 1, buyer_id: 1).save
  end

  it 'should be defined' do
    @sold_book_arr = Book.where(buyer_id: 1, seller_id: 2)
    expect(@sold_book_arr[0].valid?).to be true
  end

  it 'should not be defined for a negative user id' do
    @sold_book_arr[0] = Book.where(buyer_id: -1, seller_id: 12)
    expect(@sold_book_arr[0].valid?).to be false
  end

  it 'should not be defined without 2 arguments' do
    @sold_book_arr[0] = Book.where(buyer_id: 1)
    expect(@sold_book_arr[0].valid?).to be false
  end
end
