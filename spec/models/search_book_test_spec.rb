require 'rails_helper'

RSpec.describe Book, type: :model do

  before(:each) do
    @grinch_book = Book.new(isbn: "1234567891234", title: "Grinch Stole Christmas", edition: "12th", condition: "new", price: 100, author: "Seuss", seller_id: 104).save
    @physics_book = Book.new(isbn: "1234567891234", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo", seller_id: 104).save
  end

  it 'Newest test' do
    @found_books = Book.where("title like '%Grinch%'")
    expect(@found_books.length > 0).to be true
  end

  it 'should find results through ISBN search' do
    @found_books = Book.where("isbn like '%1234567891234%'")
    expect(@found_books.length > 0).to be true
  end

  it 'should find results through title search' do
    @found_books = Book.where("title like '%University Physics%'")
    expect(@found_books.length > 0).to be true
  end

  it 'should find results through Author search' do
    @found_books = Book.where("author like '%Milazzo%'")
    expect(@found_books.length > 0).to be true

  end

  it 'shouldnt find results with some searches' do
    @found_books = Book.where("title like '%idek%' OR author like '%Eric%' OR isbn like '%00000000000%'")
    expect(@found_books.length == 0).to be true
  end

end
