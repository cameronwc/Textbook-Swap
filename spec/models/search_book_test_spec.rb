require 'rails_helper'

RSpec.describe Book, type: :model do

	#Seed dummy db for tests.
  before(:each) do
    @ppcc_user = Account.new(name: "ppcc user", email: "user@ppcc.edu",password: "foobar", password_confirmation: "foobar")
    @uccs_user = Account.new(name: "uccs user", email: "user@uccs.edu",password: "foobar1", password_confirmation: "foobar1")
    @grinch_book = Book.new(isbn: "1665544332211", title: "Grinch Stole Christmas", edition: "12th", condition: "new", price: 100, author: "Seuss")
    @physics_book = Book.new(isbn: "1234567891234", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo")
    @ppcc_user.books << @grinch_book
    @grinch_book.seller = @ppcc_user
    @ppcc_user.save!
    @grinch_book.save!
    @uccs_user.books << @physics_book
    @physics_book.seller = @uccs_user
    @uccs_user.save!
    @physics_book.save!
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
      @found_books = Book.where("title like '%idaasda%' OR author like '%eifajiaj%' OR isbn like '%00000000000%'")
      expect(@found_books.length == 0).to be true
    end

   it 'should return multiple books if matched' do
      @found_books = Book.where("title like '%s%'")
      expect(@found_books.length > 1).to be true
   end

  end

  context 'Search functionality by University and basic search' do

    it 'should find results through university search' do
	    @found_books = Book.joins(:seller).where("email like '%@uccs.edu'")   
      expect(@found_books.length > 0).to be true
    end

    it 'should find results through university and title search' do
	    @found_books = Book.joins(:seller).where("email like '%@uccs.edu' AND title like '%University Physics%'")
	    expect(@found_books.length > 0).to be true
    end

    it 'should find results through university and author search' do
	    @found_books = Book.joins(:seller).where("email like '%@ppcc.edu' AND author like '%Seuss%'")
      expect(@found_books.length >0).to be true
    end

    it 'should find results through university and ISBN search ' do
	    @found_books = Book.joins(:seller).where("email like '%@uccs.edu' AND isbn='1234567891234'")
      expect(@found_books.length >0).to be true
    end

    it 'should not find some results' do
	    @found_books = Book.joins(:seller).where("email like '%blah.edu' AND title like 'jsadaijdi'")
	    expect(@found_books.length == 0).to be true
    end
  end

end
