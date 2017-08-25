require 'test_helper'

class Schedule::CourseControllerTest < ActionDispatch::IntegrationTest
  setup do
    campus = campus(:campus)
    get set_campi_path(campus: campus.id)
  end

  test 'should get index courses page' do
    get schedule_courses_url
    assert_response :success

    assert Course.where(session[:campus_id]), assigns(:courses)
    assert_match Course.all.first.description, @response.body
  end

  test 'show a courses schedule' do
    schedule = campus_schedules(:one)
    course = Course.first
    semester = 1
    get schedule_course_url(course: course.id, semester: 1)
    assert_response :success
    assert_match schedule.to_s, @response.body
    assert_match Course.first.description, @response.body
  end
end
