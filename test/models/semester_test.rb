require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  test "should be not save without args" do
    # skip
    semester = Semester.new
    assert_not semester.save
  end
end
