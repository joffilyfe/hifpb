require 'test_helper'

class Admin::CampusSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campus = campus(:campus)
    @campus_schedule = CampusSchedule.new(shift: 1, start: '2017-06-18 07:00:00', end: '2017-06-18 07:51:00', campus_id: @campus.id)

    sign_as_admin
  end

  test 'should get the index page' do
    get admin_campus_campus_schedules_url(@campus.id)
    assert_response :success
  end

  test 'should get the new shedule page' do
    get new_admin_campus_campus_schedule_url(@campus.id)
    assert_response :success
  end

  test "should create admin_campus_schedule" do
    assert_difference('CampusSchedule.count') do
      post admin_campus_campus_schedules_url(@campus.id), params: { campus_schedule: { end: @campus_schedule.end, shift: @campus_schedule.shift, start: @campus_schedule.start } }
    end

    assert_redirected_to admin_campus_campus_schedules_url(@campus.id)
  end

  test "should destroy admin_campus_schedule" do
    skip
    schedule = campus_schedules(:one)

    assert_difference('CampusSchedule.count', -1) do
      delete admin_campus_campus_schedule_path(schedule.campus.id, schedule.id)
    end

    assert_redirected_to admin_campus_campus_schedules_url(@campus.id)
  end
end
