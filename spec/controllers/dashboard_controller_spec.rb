require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "GET #index" do
    it "returns correct owned books for given user" do
      @user = Account.new(:name => "Sergio", :email => "test@uccs.edu", :password => "password", :password_confirmation => "password")
      #session probably wont work here
      @createdBook = Book.create(:isbn => "123456789", :title => "Test1", :edition => "1", :author => "test1", :condition => "Good", :price => "10", :seller_id => session[:user_id], :selling => False)
      @createdBook = Book.create(:isbn => "987654321", :title => "Test2", :edition => "1", :author => "test2", :condition => "Good", :price => "10", :seller_id => session[:user_id], :selling => True)
      expect(@user.OwnedBooks).to eq "Test1"
    end

    it "returns correct owned books for given user" do
      @user = Account.new(:name => "Sergio", :email => "test@uccs.edu", :password => "password", :password_confirmation => "password")
      @createdBook = Book.create(:isbn => "123456789", :title => "Test1", :edition => "1", :author => "test1", :condition => "Good", :price => "10", :seller_id => session[:user_id], :selling => False)
      @createdBook = Book.create(:isbn => "987654321", :title => "Test2", :edition => "1", :author => "test2", :condition => "Good", :price => "10", :seller_id => session[:user_id], :selling => True)
      expect(@user.SellingBooks).to eq "Test2"
    end


  end
  
  

end
