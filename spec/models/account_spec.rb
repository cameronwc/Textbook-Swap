require 'rails_helper'

RSpec.describe Account, type: :model do
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
end
