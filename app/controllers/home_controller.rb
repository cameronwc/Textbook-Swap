class HomeController < ApplicationController
  def index
    @message = "test"
    p session[:user_id] || "1000"
  end
end
