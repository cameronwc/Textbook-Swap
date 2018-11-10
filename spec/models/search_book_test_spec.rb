require 'rails_helper'

RSpec.describe Book, type: :model do

	#Seed dummy db for tests.
  before(:each) do
    @ppcc_user = Account.new(name: "ppcc user", email: "user@ppcc.edu",password: "foobar", password_confirmation: "foobar")
    @uccs_user = Account.new(name: "uccs user", email: "user@uccs.edu",password: "foobar1", password_confirmation: "foobar1")
    @grinch_book = Book.new(isbn: "1665544332211", title: "Grinch Stole Christmas", edition: "2nd", condition: "new", price: 150, author: "Seuss", selling: true)
    @physics_book = Book.new(isbn: "1234567891234", title: "University Physics", edition: "4th", condition: "fair", price: 100, author: "Milazzo", selling: true)
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
      found_books = Book.find_books("Grinch", "")
      expect(found_books.length > 0).to be true
    end

    it 'should find results through exact ISBN search' do
      found_books = Book.find_books("1665544332211", "")
      expect(found_books.length > 0).to be true
    end

    it 'should find results through full title search' do
      found_books = Book.find_books("University Physics", "")
      expect(found_books.length > 0).to be true
    end

    it 'should find results through Author search' do
      found_books = Book.find_books("Milazzo", "")
      expect(found_books.length > 0).to be true
    end

    it 'shouldnt find results with some searches' do
      found_books = Book.find_books("00000000000", "")
      expect(found_books.length == 0).to be true
    end

   it 'should return multiple books if matched' do
      found_books = Book.find_books("s", "")
      expect(found_books.length > 1).to be true
   end

   it 'should have case-insensitive searches' do
	   found_books = Book.find_books("physics", "")
	   expect(found_books.length > 0).to be true
   end

  end


  context 'Search functionality by University and basic search' do

    it 'should find results through university search' do
	    found_books = Book.find_books("", "uccs") 
            expect(found_books.length > 0).to be true
    end

    it 'should find results through university and title search' do
	    found_books = Book.find_books("University Physics", "uccs")
	    expect(found_books.length > 0).to be true
    end

    it 'should find results through university and author search' do
	    found_books = Book.find_books("Seuss", "ppcc")
            expect(found_books.length >0).to be true
    end

    it 'should find results through university and ISBN search ' do
	    found_books = Book.find_books("1234567891234", "uccs")
            expect(found_books.length >0).to be true
    end

    it 'should not find some results' do
	    found_books = Book.find_books("blahblahblah", "blah")
	    expect(found_books.length == 0).to be true
    end
  end


  context 'Sort functionality' do
  
 	it 'should sort by edition' do
		book1 = double(:edition => "12th")
		book2 = double(:edition => "10th")
		found_books = [book1, book2]
    #found_books = [@physics_book,@grinch_book]
		sorted_books = Book.sort_books("edition", found_books)
		expect(sorted_books).to eq [book1, book2]
    #expect(sorted_books).to eq [@grinch_book,@physics_book]
	end

	it 'should sort by condition' do
		book1 = double(:condition => "Poor")
		book2 = double(:condition => "New")
		book3 = double(:condition => "Fair")
		found_books = [book1, book2, book3]
		sorted_books = Book.sort_books("condition", found_books)
		expect(sorted_books).to eq [book2, book3, book1]
	end

	it 'should sort by price' do
		book1 = double(:price => 10)
		book2 = double(:price => 5)
		book3 = double(:price => 100)
		found_books = [book1, book2, book3]
		sorted_books = Book.sort_books("price", found_books)
		expect(sorted_books).to eq [book2, book1, book3]
	end

  end

end
