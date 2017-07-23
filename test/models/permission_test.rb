require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  test 'create an invalid permission' do
    permission = Permission.new
    assert_not permission.valid?
  end

  test 'create a valid permission' do
    permission = permissions(:one)
    assert permission.valid?
  end
end
