require 'test_helper'

class Admin::ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_as_admin
  end

  test "should get all teachers" do
  	# skip
  	get admin_reports_teachers_path
    assert_equal Teacher.all, assigns(:teachers)
  end

  test "should get all laboratories" do
  	# skip
  	get admin_reports_laboratories_path
    assert_equal Laboratory.all, assigns(:laboratories)
  end

  test "should get all schoolrooms" do
  	# skip
  	get admin_reports_schoolrooms_path
    assert_equal Schoolroom.all, assigns(:schoolrooms)
  end

  test "should get all lessons from teachers" do
  	# skip
  	get admin_report_teacher_path(teachers(:one))
    assert_equal 3, assigns(:lessons).count
  end

  test "should get all lessons from laboratories" do
  	# skip
  	get admin_report_laboratory_path(laboratories(:two))
    assert_equal 2, assigns(:lessons).count
  end

  test "should get all lessons from schoolrooms" do
  	# skip
  	get admin_report_schoolroom_path(schoolrooms(:two))
    assert_equal 2, assigns(:lessons).count
  end
end
