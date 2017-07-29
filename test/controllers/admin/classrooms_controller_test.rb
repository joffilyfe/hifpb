require 'test_helper'

class Admin::ClassroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_as_admin
    @admin_classroom = classrooms(:one)
  end

  test "should get index" do
    get admin_classrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_classroom_url
    assert_response :success
  end

  test "should create classroom" do
    assert_difference('Classroom.count') do
      post admin_classrooms_url, params: { classroom: { code: @admin_classroom.code, course_id: @admin_classroom.course_id, course_subject_id: @admin_classroom.course_subject_id, name: @admin_classroom.name, semester_id: @admin_classroom.semester_id, teacher_id: @admin_classroom.teacher_id } }
    end

    assert_redirected_to admin_classroom_url(Classroom.last)
  end

  test "should not create a classroom" do
    assert_no_difference('Classroom.count') do
      post admin_classrooms_url, params: { classroom: {code: 1} }
    end

    assert_response :success
  end

  test "should show classroom" do
    get admin_classroom_url(@admin_classroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_classroom_url(@admin_classroom)
    assert_response :success
  end

  test "should update classroom" do
    patch admin_classroom_url(@admin_classroom), params: { classroom: { code: @admin_classroom.code, course_id: @admin_classroom.course_id, course_subject_id: @admin_classroom.course_subject_id, name: @admin_classroom.name, semester_id: @admin_classroom.semester_id, teacher_id: @admin_classroom.teacher_id } }
    assert_redirected_to admin_classroom_url(@admin_classroom)
  end

  test 'should not update classroom' do
    patch admin_classroom_url(@admin_classroom), params: { classroom: {course_id: 10000} }
    assert_response :success
  end

  test "should destroy classroom" do
    assert_difference('Classroom.count', -1) do
      delete admin_classroom_url(@admin_classroom)
    end
    assert_redirected_to admin_classrooms_url
  end

  test "should filter classroms by course" do
    get admin_course_classrooms_path(course_id: 10000)
    assert_not_equal Classroom.where(course_id: 10000), assigns(:classroms)
  end
end
