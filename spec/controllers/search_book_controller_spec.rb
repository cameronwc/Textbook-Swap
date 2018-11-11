require 'rails_helper'

RSpec.describe SearchBookController, type: :controller do
  before(:each) do
    @ppcc_user = Account.new(name: "ppcc user", email: "user@ppcc.edu",password: "foobar", password_confirmation: "foobar")
    @uccs_user = Account.new(name: "uccs user", email: "user@uccs.edu",password: "foobar1", password_confirmation: "foobar1")
    @grinch_book = Book.new(isbn: "1665544332211", title: "Grinch Stole Christmas", edition: "12th", condition: "new", price: 100, author: "Seuss", :selling => true)
    @physics_book = Book.new(isbn: "1234567891234", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo", :selling => true)
    @physics_book2 = Book.new(isbn: "1234567891234", title: "University Physics", edition: "11th", condition: "fair", price: 50, author: "Milazzo",:selling => true)

    @ppcc_user.books << @grinch_book
    @grinch_book.seller = @ppcc_user
    @ppcc_user.save!
    @grinch_book.save!

    @uccs_user.books << @physics_book
    @uccs_user.books << @physics_book2
    @physics_book.seller = @uccs_user
    @physics_book2.seller = @uccs_user
    @uccs_user.save!
    @physics_book.save!
    @physics_book2.save!
  end
  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "calls method to assign search texts for university and book types" do
      text_hash = {"search_text" => 'physics',"search_university" => "uccs"}
      expect(Book).to receive(:find_books).with('physics','uccs').and_return([@physics_book])
      post :index, params: text_hash
    end
  end

  describe "Sorts books and sends to correct page" do

    it "sorts books by edition" do
      filter = "edition"
      books = Book.find_books('physics', 'uccs')
      sorted_books = Book.sort_books(filter, books)
      total_search = {"sort_filter" => filter, "search_text"=>'physics', "search_university"=>'uccs'}
      expect(Book).to receive(:sort_books).with(filter,books).and_return(sorted_books)
      post :index, params: total_search


    end

    it "sorts books by condition" do
      filter = 'condition'
      books = Book.find_books('physics', 'uccs')
      total_search = {"sort_filter" => filter, "search_text"=>'physics', "search_university"=>"uccs"}
      sorted_books = Book.sort_books(filter,books)
      expect(Book).to receive(:sort_books).with(filter,books).and_return(sorted_books)
      post :index, params: total_search
    end

    it "sorts books by price" do
      filter = 'price'
      books = Book.find_books('physics', 'uccs')
      total_search = {"sort_filter" => filter, "search_text"=>"physics", "search_university"=>"uccs"}
      sorted_books = Book.sort_books(filter,books)
      expect(Book).to receive(:sort_books).with(filter,books).and_return(sorted_books)
      post :index, params: total_search
    end
  end

end
