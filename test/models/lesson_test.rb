require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "must not be saved when times are already" do
    # skip
    lesson = Lesson.new(
      {"day"=>"Segunda", "laboratory"=>laboratories(:one), "schoolroom"=>schoolrooms(:one),"classroom"=> classrooms(:one),"campus_schedule"=> campus_schedules(:one)}
    )
    assert_not lesson.save
  end

  test "can not save if the teacher already teaches at this time" do
    # skip
    lesson = Lesson.new(
      {"day"=>"Segunda", "laboratory"=>laboratories(:one), "schoolroom"=>schoolrooms(:one),"classroom"=> classrooms(:one),"campus_schedule"=> campus_schedules(:one)}
    )
    assert_not lesson.save
  end

   test "should not save without lab or schoolroom" do
    # skip
    lesson = Lesson.new(
      {"day"=>"Segunda", "laboratory"=>nil, "schoolroom"=>nil, "classroom"=> classrooms(:two),"campus_schedule"=> campus_schedules(:one)}
    )
    assert_not lesson.save
  end
end
