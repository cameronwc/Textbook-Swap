require 'rails_helper'

RSpec.describe Book, type: :model do

  before(:each) do
    Account.new(name: "ppcc user", email: "user@ppcc.edu",password: "foobar00", password_confirmation: "foobar00") do |user|
      @ppcc_user = user
    end
  end

  it 'should be defined' do
    @book = Book.create(:isbn => "1234567891234", :title => "University Physics", :edition => "12th", :author => "Milazzo", :condition => "new", :price => 100)
    @book.seller = @ppcc_user
    # @current_user.books << @book
    expect(@book.valid?).to be true
  end
  it 'should not be defined' do
    @book = Book.create(:isbn => "", :title => "University Physics", :edition => "12th", :author => "Milazzo", :condition => "new", :price => 100)
    expect(@book.valid?).to be false
  end
  it 'should not be defined' do
    @book = Book.new(:isbn => "12345", :title => "University Physics", :edition => "12th", :author => "Milazzo", :condition => "new", :price => 100)
    expect(@book.valid?).to be false
  end
  it 'should not be too long' do
    @book = Book.new(:isbn => "1234567891234" * 10, :title => "University Physics", :edition => "12th", :author => "Milazzo", :condition => "new", :price => 100)
    expect(@book.valid?).to be false
  end 
end
