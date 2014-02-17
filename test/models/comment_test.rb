require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  fixtures(:posts)
  fixtures(:comments)

  test "can initalise a valid comment" do
    post = posts(:valid)
    comment = comments(:valid)
    assert comment.valid?, comment.errors.each {|error| error.to_s}
  end

  test "comment invalid without name" do
    comment = comments(:invalid_no_name)
    assert comment.invalid?
  end

  test "comment inavlid without body" do
    comment = comments(:invalid_no_body)
    assert comment.invalid?
  end
end
