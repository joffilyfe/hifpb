require 'test_helper'

class Schedule::LaboratoryControllerTest < ActionDispatch::IntegrationTest
  setup do
    campus = campus(:campus)
    get set_campi_path(campus: campus.id)
  end

  test 'should get laboratories page' do
    campus = campus(:campus)
    get schedule_laboratories_url
    assert_response :success
    assert_template :index
    assert_equal Laboratory.where(campus: campus), assigns(:labs)
  end

  test 'show a laboratory schedule' do
    lab = laboratories(:one)
    get schedule_laboratory_url(lab: lab.id)
    assert_response :success
    assert_match /DEPS <br> Sala-01 <br> Info-01/, @response.body
  end
end
