require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  test 'should be not save without args' do
    semester = Semester.new
    assert_not semester.save
  end

  test 'should be a valid semester' do
    semester = Semester.new({year: "2015", semester: "2"})
    assert semester.valid?
  end

  test 'should not be saved when start is in other semester' do
    semester = Semester.new({year: "2016", semester: "2"})
    invalid = Semester.new({year: "2016", semester: "2"})

    assert semester.save
    assert_not invalid.save
  end
end
