require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get index" do
    get "index"
    assert_response :success
    assert_not_nil assigns(:posts)
    assert_select '#menu_content #name h1', maximum: 1
    assert_select '#main_content .post h2', minimum: 3
  end
end
