require 'rails_helper'

RSpec.describe LoginController, type: :controller do

    describe "create account if user provides correct information" do
            before  do
                params = {name: "hello", email: "testing@uccs.edu", password: "password", password_confirmation: "password"}
                post :create,  params: params
            end
            it { expect(response).to redirect_to('/') }

    end

    describe " do not create account if user provides incorrect information" do
        before  do
            params = {name: "hello", email: "testing@uccs.com", password: "password", password_confirmation: "password"}
            post :create,  params: params
        end
        it { expect(response).to redirect_to('/login') }
    end

  #describe "check login info against database" do
   #"#{ @ppcc_user = Account.new(name: "ppcc user", email: "newemail@ppcc.edu",password: "foobar", password_confirmation: "foobar")
    #@ppcc_user.save!
    #before  do
      #  params = {user_email: "user@ppcc.edu", user_password: "foobar"}
      #  post :check,  params: params
    #end
    #it { expect(response).to redirect_to('/') }
  #end
  describe "logout resets the session #destroy" do

  end
end
