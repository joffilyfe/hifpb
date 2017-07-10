require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'should not create a invalid user' do
    user = User.new
    assert_not user.valid?
  end

  test 'should create a valid user' do
    user = users(:user_a)
    assert user.valid?
  end
end
