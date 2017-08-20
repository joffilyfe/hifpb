require 'test_helper'

class Schedule::SchoolroomControllerTest < ActionDispatch::IntegrationTest
  setup do
    campus = campus(:campus)
    get set_campi_path(campus: campus.id)
  end

  test 'should get schoolrooms page' do
    campus = campus(:campus)
    get schedule_schoolrooms_url
    assert_response :success
    assert_template :index
    assert_equal Schoolroom.where(campus: campus).order(name: :asc), assigns(:rooms)
  end

  test 'show a schoolroom schedule' do
    schoolroom = schoolrooms(:one)
    get schedule_schoolroom_url(room: schoolroom.id)
    assert_response :success
    assert_template :show
  end
end
