require 'test_helper'

class Admin::SemestersControllerTest < ActionDispatch::IntegrationTest
    test "should not be saved when start is higher than the end" do
    # skip
    semester = Semester.new(
      {year: "2015", semester: "2", start_date: "2015-12-01", end_date: "2015-07-31"}
    )
    assert_not semester.save
  end

  test "should not be saved when start is in other semester" do
    # skip
    semester = Semester.new(
      {year: "2016", semester: "2", start_date: "2016-12-29", end_date: "2017-06-25"}
    )
    assert_not semester.save
  end
end
