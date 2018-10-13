require 'rails_helper'

RSpec.describe Book, type: :model do

  before(:each) do
    @grinch_book = Book.new(isbn: "1665544332211", title: "Grinch Stole Christmas", edition: "12th", condition: "new", price: 100, author: "Seuss", seller_id: "jsmith@uccs.edu").save
    @physics_book = Book.new(isbn: "1234567891234", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo", seller_id: "klamer@ppcc.edu").save
  end

  context 'Basic search functionality' do
    it 'should find results with partial title' do
      @found_books = Book.where("title like '%Grinch%'")
      expect(@found_books.length > 0).to be true
    end

    it 'should find results through exact ISBN search' do
      @found_books = Book.where("isbn='1665544332211'")
      expect(@found_books.length > 0).to be true
    end

    it 'should find results through full title search' do
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

  context 'Search functionality by University and basic search' do

    it 'should find results through university search' do
	    @found_books = Book.where("seller_id like '%@uccs.edu'")
       expect(@found_books.length > 0).to be true
    end

    it 'should find results through university and title search' do
	    @found_books = Book.where("seller_id like '%@ppcc.edu' AND title like '%University Physics%'")
	    expect(@found_books.length >0).to be true
    end

    it 'third' do

    end

    it 'fourth' do

    end
  end

end
