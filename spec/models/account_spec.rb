require 'rails_helper'

RSpec.describe Account, type: :model do
  before(:each) do
    @user = Account.new(:name => "Sergio", :email => "test@uccs.edu", :password => "password", :password_confirmation => "password")
    #session probably wont work here
    @createdBook1 = Book.create(:isbn => "123456789", :title => "Test1", :edition => "1", :author => "test1", :condition => "Good", :price => "10", :selling => false)
    @createdBook2 = Book.create(:isbn => "123456789", :title => "Test2", :edition => "1", :author => "test2", :condition => "Good", :price => "10", :selling => true,:sold => false)
    @createdBook3 = Book.create(:isbn => "123456789", :title => "Test3", :edition => "1", :author => "test3", :condition => "Good", :price => "10", :selling => false, :sold => true)

  end
  #@user = Account.new(name: "example user", email: "user@example.edu",password: "foobar", password_confirmation: "foobar")
  it 'should be defined' do
    #@user.name = ""
    @user = Account.new(name: "example user", email: "user@example.edu",password: "foobar", password_confirmation: "foobar")
    expect(@user.valid?).to be true
  end
  it 'should not be defined' do
    @user = Account.new(name: "", email: "user@example.com",password: "foobar", password_confirmation: "foobar")
    expect(@user.valid?).to be false
  end
  it 'should not be defined' do
    @user = Account.new(name: "", email: "",password: "foobar", password_confirmation: "foobar")
    expect(@user.valid?).to be false
  end
  it 'should not be too long' do
    @user = Account.new(name: "a" * 51, email: "a" * 244 + "@example.com",password: "foobar", password_confirmation: "foobar")
    expect(@user.valid?).to be false
  end 
  it 'should work for .edu accounts' do
    @user = Account.new(name: "example user", email: "user@example.edu",password: "foobar", password_confirmation: "foobar")
    expect(@user.valid?).to be true
  end
  it 'should not work for non .edu accounts' do
    @user = Account.new(name: "John", email: "lol@example.lol",password: "foobar", password_confirmation: "foobar")
    expect(@user.valid?).to be false
  end
  it 'should not work for small passwords' do
    @user = Account.new(name: "John", email: "lol@example.edu",password: "fooba", password_confirmation: "fooba")
    expect(@user.valid?).to be false
  end
  it "should add a book to users books" do
    @createdBook1.seller = @user
    @user.books << @createdBook1
    expect(@user.books.length > 0).to be true
  end
  it "should add a book to users selling books" do
    @createdBook2.seller = @user
    @user.books << @createdBook2
    @createdBook2.save!
    @check = @user.books.where(:selling => true)
    expect(@check.length > 0).to be true
  end
  it "should add a book to users sold books" do
    @createdBook3.seller = @user
    @user.books << @createdBook3
    @createdBook3.save!
    @check = @user.books.where(:sold => true).length
    expect(@check > 0).to be true
  end


end
