require 'rails_helper'

RSpec.describe LoginController, type: :controller do

    describe "create" do
        it "creates account for user with proper credentials" do
          let(:params) {
              {name: "Test"}
              {email: "testing@uccs.edu"}
              {password: "password"}
              {password_confirmation: "password"}
          }
          expect(compare_users(@uccs_user)).to eq(false)
        end
        it "return true with users from the same university" do
          log_in(@uccs_user)
          expect(compare_users(@uccs_user_2)).to eq(true)
        end
      end

end
