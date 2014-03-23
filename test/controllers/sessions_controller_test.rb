require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get login" do
    tom = users(:two)
    post :create, name: tom.name, password: 'secret'
    assert_redirected_to root_url
  end

  test "should fail login" do
    tom = users(:two)
    post :create, name: tom.name, password: 'fail'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to root_url
  end

end
