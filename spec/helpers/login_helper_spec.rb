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
  pending "add some examples to (or delete) #{__FILE__}"
end

# before(:each) do
#   @ppcc_user = Account.new(name: "ppcc user", email: "user@ppcc.edu",password: "foobar", password_confirmation: "foobar")
#   @uccs_user = Account.new(name: "uccs user", email: "user@uccs.edu",password: "foobar1", password_confirmation: "foobar1")
#   @ppcc_user2 = Account.new(name: "ppcc user", email: "user@ppcc.edu",password: "foobar2", password_confirmation: "foobar2")
#   @uccs_user2 = Account.new(name: "uccs user", email: "user@uccs.edu",password: "foobar3", password_confirmation: "foobar3")
#   @grinch_book = Book.new(isbn: "1665544332211", title: "Grinch Stole Christmas", edition: "12th", condition: "new", price: 100, author: "Seuss")
#   @physics_book = Book.new(isbn: "1234567891234", title: "University Physics", edition: "12th", condition: "new", price: 100, author: "Milazzo")
#   @ppcc_user.books << @grinch_book
#   @grinch_book.seller = @ppcc_user
#   @ppcc_user.save!
#   @grinch_book.save!
#   @uccs_user.books << @physics_book
#   @physics_book.seller = @uccs_user
#   @uccs_user.save!
#   @physics_book.save!
# end
#
# describe "GET #contact_info" do
#   it "compare " do
#     post :, params: {'book_id' => @grinch_book}
#     expect(response).to eq(@ppcc_user.id)
#   end
# end
