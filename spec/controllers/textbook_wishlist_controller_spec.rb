require 'rails_helper'

RSpec.describe TextbookWishlistController, type: :controller do
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

  describe "GET #create" do
    it "returns http success" do
      post :create, params: {'user_id' => 9999, 'book_id' => 9999 }
      expect(response).to have_http_status(302)
    end
  end
  
  describe "GET #destroy" do
    it "returns http success" do
      post :create, params: {'user_id' => 9999, 'book_id' => 9999 }
      post :destroy, params: {'user_id' => 9999, 'book_id' => 9999}
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #contact_info" do
    it "display correct contact info" do
      get :contact_info, params: {'book_id' => @grinch_book}
      expect(response).to have_http_status(302)
    end
  end
end
