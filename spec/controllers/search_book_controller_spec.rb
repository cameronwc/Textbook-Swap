require 'rails_helper'

RSpec.describe SearchBookController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @text" do
    	text = 
    end
  end

end
