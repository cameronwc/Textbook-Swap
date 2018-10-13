require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "GET #index" do
    it "returns correct owned books for given user" do
      @user = Account.new(:name => "Sergio", :email => "test@uccs.edu", :password => "password", :password_confirmation => "password")
      @createdBook = Book.create(:isbn => "123456789", :title => "Test", :edition => "1", :author => "test" :condition => "Good", :price => "10", :seller_id => session[:user_id])
      expect(@user.OwnedBooks).to eq "Test"
    end
  end

  

end
