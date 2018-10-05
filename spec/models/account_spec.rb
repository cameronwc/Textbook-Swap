require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'should be defined' do
    @user = Account.new(name: "example user", email: "user@example.edu")
    expect(@user.valid?).to be true
  end
  it 'should not be defined' do
    @user = Account.new(name: "", email: "user@example.com")
    expect(@user.valid?).to be false
  end
  it 'should not be defined' do
    @user = Account.new(name: "", email: "")
    expect(@user.valid?).to be false
  end
  it 'should not be too long' do
    @user = Account.new(name: "a" * 51, email: "a" * 244 + "@example.com")
    expect(@user.valid?).to be false
  end 
  it 'should work for .edu accounts' do
    @user = Account.new(name: "John", email: "lol@example.edu")
    expect(@user.valid?).to be true
  end
  it 'should not work for non .edu accounts' do
    @user = Account.new(name: "John", email: "lol@example.lol")
    expect(@user.valid?).to be false
  end
  it 'should not work for accounts that already exist' do
    @user = Account.new(name: "John", email: "lol@example.lol")
    @user_dp = @user.dup
    expect(@user_dp.valid?).to be false
  end
end
