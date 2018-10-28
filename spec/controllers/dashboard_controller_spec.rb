require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  before(:each) do
    @ppcc_user = Account.new(name: "ppcc user", email: "user@ppcc.edu",password: "foobar", password_confirmation: "foobar")
    @grinch_book = Book.new(isbn: "1665544332211", title: "Grinch Stole Christmas", edition: "12th", condition: "new", price: 100, author: "Seuss")
    @ppcc_user.books << @grinch_book
    @grinch_book.seller = @ppcc_user
    @grinch_book.save!
    @ppcc_user.save!
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, session: {'user_id' => @ppcc_user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update, params: {'book_id' => @grinch_book.id}, session: {'user_id' => @ppcc_user.id}
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #sold" do
    it "returns http success" do
      get :update, params: {'book_id' => @grinch_book.id}, session: {'user_id' => @ppcc_user.id}
      get :sold, params: {'book_id' => @grinch_book.id}, session: {'user_id' => @ppcc_user.id}
      expect(response).to have_http_status(302)
    end
  end

  
end
