#LoginHelper is included so that the functions included can be used anywhere in the application
class ApplicationController < ActionController::Base
    #protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    include LoginHelper


end
