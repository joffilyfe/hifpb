require 'test_helper'

class Admin::CourseControllerTest < ActionDispatch::IntegrationTest
  def setup
    get importar_campus_admin_campus_url
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
end
