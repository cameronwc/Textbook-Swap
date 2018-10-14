require 'rails_helper'

RSpec.describe SoldBook, type: :model do

  before(:each) do
    @grinch_book = Book.new(isbn: "1665544332211", title: "Grinch Stole Christmas", edition: "12th", condition: "new", price: 100, author: "Seuss", seller_id: 2, buyer_id: 1, sold: TRUE).save
    @physics_book = Book.new(isbn: "1234567891234", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo", seller_id: 1, buyer_id: 1, sold: FALSE).save
  end

  it 'should be defined' do
    @sold_book_arr = Book.where(buyer_id: 1, seller_id: 2, sold: TRUE)
    expect(@sold_book_arr[0].valid?).to be true
  end

  it 'should not be defined for a negative user id' do
    @sold_book_arr[0] = Book.where(buyer_id: -1, seller_id: 12, sold: TRUE)
    expect(@sold_book_arr[0].valid?).to be false
  end

  it 'should not be defined without 3 arguments' do
    @sold_book_arr[0] = Book.where(buyer_id: 1)
    expect(@sold_book_arr[0].valid?).to be false
  end

  it "updates sold status" do
    Book.where(:isbn => "1234567891234", :seller_id => 1).update_all(sold: true)
    expect(Book.find_by_sold(sold = true)).should(exist)
  end
end
