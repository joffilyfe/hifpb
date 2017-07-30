require 'test_helper'

class TeacherTest < ActiveSupport::TestCase

  test 'should not create a invalid teacher' do
    teacher = Teacher.new
    assert_not teacher.valid?
  end

  test 'should create a valid teacher' do
    teacher = teachers(:one)
    assert teacher.valid?
  end
end
