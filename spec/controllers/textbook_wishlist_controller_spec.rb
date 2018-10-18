require 'rails_helper'

RSpec.describe TextbookWishlistController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "POST #create" do
    it "returns http success" do
      post :create
      expect(response).to have_http_status(:success)
    end
  end
  describe "POST #destroy" do
    it "returns http success" do
      post :destroy
      expect(response).to have_http_status(:success)
    end
  end
end