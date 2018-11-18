require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LoginHelper. For example:
#
# describe LoginHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end


RSpec.describe LoginHelper, type: :helper do
before(:each) do
  @ppcc_user = Account.new(name: "ppcc user", email: "newuser@ppcc.edu",password: "foobar", password_confirmation: "foobar")
  @uccs_user = Account.new(name: "uccs user", email: "newuser@uccs.edu",password: "foobar1", password_confirmation: "foobar1")
  @uccs_user_1 = Account.new(name: "uccs user 1", email: "user1@uccs.edu",password: "foobar", password_confirmation: "foobar")
  @uccs_user_2 = Account.new(name: "uccs user 2", email: "user2@uccs.edu",password: "foobar1", password_confirmation: "foobar1")
  @grinch_book = Book.new(isbn: "1665544332211", title: "Grinch Stole Christmas", edition: "12th", condition: "new", price: 100, author: "Seuss")
  @physics_book = Book.new(isbn: "1234567891234", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo")
  @uccs_user.books << @grinch_book
  @ppcc_user.books << @physics_book
  @ppcc_user.save!
  @uccs_user.save!
  @uccs_user_1.save!
  @uccs_user_2.save!
  @grinch_book.save!
  @physics_book.save!

end
  describe "current_user" do
    it "returns the id of the current logged in user" do
      log_in(@ppcc_user)
      expect(current_user.name).to eq("ppcc user")
    end
    it "returns null if no user is logged in" do
      testUser = current_user
      expect(testUser.nil?).to eq(true)
    end
  end
  describe "login_compare" do
    it "returns / if the typed password and the actual password match" do
      expect(login_compare(@ppcc_user,"foobar")).to eq("/")
    end
    it "returns /login if the typed password and the actual password don't match" do
      expect(login_compare(@ppcc_user,"wrong")).to eq("/login")
    end
  end
  describe "logged_in?" do
    it "should return true when the user is logged in" do
      log_in(@ppcc_user)
      expect(logged_in?).to eq(true)
    end
    it "should return false when the user is not logged in" do
      expect(logged_in?).to eq(false)
    end

  end
  describe "compare_ users" do
    it "return false with users from a different university" do
      log_in(@ppcc_user)
      expect(compare_users(@uccs_user)).to eq(false)
    end
    it "return true with users from the same university" do
      log_in(@uccs_user)
      expect(compare_users(@uccs_user_2)).to eq(true)
    end
  end

  describe "contact_info_display" do
    it "returns no contact info if users are in a different university" do
      log_in(@ppcc_user)
      expect(contact_info_display(compare_users(@grinch_book.seller),@grinch_book.seller.email )).to eq('<p>Not same university - no contact info displayed</p>')
    end
    it "returns contact info if users are in the same university" do
      log_in(@uccs_user_1)
      expect(contact_info_display(compare_users(@grinch_book.seller),@grinch_book.seller.email )).to eq("<a class=\"ui basic small green button\" href=\"mailto:newuser@uccs.edu\">Email Seller: newuser@uccs.edu</a>")
    end

    it "returns no contact info if the users is not logged in" do
      expect(contact_info_display(compare_users(@grinch_book.seller),@grinch_book.seller.email )).to eq('<a href="/login">Please login to view email</a>')
    end
  end
end