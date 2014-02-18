require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get index" do
    get "index"
    assert_response :success
    assert_not_nil assigns(:posts)
    assert_select '#content h1', maximum: 1
    assert_select '#content .post h2', minimum: 3
  end
end
