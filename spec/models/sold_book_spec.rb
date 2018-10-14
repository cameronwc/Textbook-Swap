require 'rails_helper'

RSpec.describe SoldBook, type: :model do
  it 'should be defined' do
    @sold_book = SoldBook.new(user_id: 12, book_id: 2)
    expect(@sold_book.valid?).to be true
  end

  it 'should not be defined for a negative user id' do
    @sold_book = SoldBook.new(user_id: -1, book_id: 1)
    expect(@SoldBook.valid?).to be false
  end

  it 'should not be defined without 2 arguments' do
    @sold_book = SoldBook.new(user_id: 1)
    expect(@sold_book.valid?).to be false
  end
end
