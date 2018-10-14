require 'rails_helper'

RSpec.describe SoldBooksController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "UPDATE sold" do
    it "updates sold status" do
      # psql query: UPDATE #book SET sold = TRUE WHERE #isbn = isbn AND #seller_id = seller_id
      book = Book.create(:isbn => 123456789, :title => "Test Textbook", :edition => "12th", :seller_id => 54321,
                         :author => "Test Author", :condition => "new", :price => 30, :sold => FALSE)
      book.save!
      Book.where(:isbn => 123456789, :seller_id => 54321).update_all(sold: true)
      expect(Book.find_by_sold(sold = true)).should(exist)
      Book.delete(isbn = 123456789)
    end
  end
end
