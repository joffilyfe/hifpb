require 'test_helper'

class SchoolroomTest < ActiveSupport::TestCase
  test "should be not save without args" do
    # skip
    schoolroom = Schoolroom.new
    assert_not schoolroom.save
  end
end
