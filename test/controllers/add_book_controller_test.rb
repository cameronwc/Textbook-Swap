require 'test_helper'

#Testing the add book controller.
class AddBookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get add_book_index_url
    assert_response :success
  end

end
