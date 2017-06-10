require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  test 'should not create an invalid course' do
    campus_jp = campus(:campus)
    course = Course.new(campus: campus_jp)

    assert_not course.valid?
  end

  test 'should create a valid course' do
    course = courses(:tsi)

    assert course.valid?
    assert_equal course.code, 36
  end
end
