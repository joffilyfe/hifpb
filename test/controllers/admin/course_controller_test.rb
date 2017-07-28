require 'test_helper'

class Admin::CourseControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_as_admin
    get importar_admin_campus_index_url
  end

  test 'should import courses from suap' do
    post importar_admin_courses_url, params: {id_campus: 39, ano_letivo: 2017, periodo_letivo: 1}
    assert_not_nil Course.find_by(campus: 39)

    assert_redirected_to admin_courses_url
  end

  test 'should not duplicate courses in import stage' do
    post importar_admin_courses_url(id_campus: 39, ano_letivo: 2017, periodo_letivo: 1)

    count = Course.count
    post importar_admin_courses_url(id_campus: 39, ano_letivo: 2017, periodo_letivo: 1)

    assert_equal count, Course.count
  end

  test "should not import courses without params" do
    post importar_admin_courses_url
    assert_response :redirect
    follow_redirect!
    assert_match /Erro ao importar dados/, @response.body
  end

  test "should filter courses by campus" do
    get admin_campus_courses_path(39)
    assert_not_equal Course.where(campus_id: 39), assigns(:courses)
  end

  test "should show all courses" do
    get admin_courses_url
    assert Course.all, assigns: @courses
  end

end
