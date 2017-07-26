require 'test_helper'

class Admin::CourseSubjectControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_as_admin
  end

  test "should get show" do
    get admin_course_subject_index_url
    assert_response :success
  end

  test "should import some subject courses" do
    post importar_admin_course_subject_index_url, params: {id_curso: 67}
    assert_response :redirect
    follow_redirect!
    assert_match /Foram importadas \d+ disciplinas com sucesso/, @response.body.to_s
  end

  test "should not import subject courses, print error message" do
    post importar_admin_course_subject_index_url
    assert_response :redirect
    follow_redirect!
    assert_match 'Erro ao importar dados', @response.body
  end

  test "should filter subjects by course" do
    get admin_course_course_subject_url(course_id: 10000)
    assert_not_equal CourseSubject.where(course_id: 10000), assigns(:course_subject)
  end

end
