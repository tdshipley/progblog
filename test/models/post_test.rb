require 'test_helper'

class PostTest < ActiveSupport::TestCase
  fixtures :posts

  test "can initalise a valid post" do
    post = posts(:valid)
    assert post.valid?, post.errors.each {|error| error.to_s}
  end

  test "post without a title is invalid" do
    post = posts(:invalid_no_title)
    assert post.invalid?
  end

  test "post without a body is invalid" do
    post = posts(:invalid_no_body)
    assert post.invalid?
  end
end
