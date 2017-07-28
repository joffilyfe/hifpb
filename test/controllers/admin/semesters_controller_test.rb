require 'test_helper'

class Admin::SemestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_as_admin
    @admin_semester = semesters(:one)
    @admin_semester_two = semesters(:two)
  end

  test "should get index semesters" do
    get admin_semesters_path
    assert_response :success
  end

  test "should get new semester" do
    get new_admin_semester_url
    assert_response :success
  end

  test "should create semester" do
    assert_difference('Semester.count') do
      post admin_semesters_path, params: {semester: {year: "2015", semester: "2", status: true } }
    end
    assert_redirected_to admin_semesters_path
  end

  test "should get edit semester" do
    get edit_admin_semester_path(@admin_semester)
    assert_response :success
  end

  test "should update semester" do
    patch admin_semester_path(@admin_semester), params: {semester: {year: "2015", semester: "1", status: true } }
    assert_redirected_to admin_semesters_path
  end


  test "should destroy semester" do
    assert_difference('Semester.count', -1) do
      delete admin_semester_path(@admin_semester_two)
    end
    assert_redirected_to admin_semesters_path
  end

end
