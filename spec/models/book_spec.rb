require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'should be defined' do
    @book = Book.new(isbn: "1234567891234", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo", seller_id: "jsmith@uccs.edu")
    expect(@book.valid?).to be true
  end
  it 'should not be defined' do
    @book = Book.new(isbn: "", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo", seller_id: "jsmith@uccs.edu")
    expect(@book.valid?).to be false
  end
  it 'should not be defined' do
    @book = Book.new(isbn: "123333", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo", seller_id: "jsmith@uccs.edu")
    expect(@book.valid?).to be false
  end
  it 'should not be too long' do
    @book = Book.new(isbn: "123333"*10, title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo", seller_id: "jsmith@uccs.edu")
    expect(@book.valid?).to be false
  end 
end
