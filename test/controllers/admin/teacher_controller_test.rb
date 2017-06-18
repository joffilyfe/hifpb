require 'test_helper'

class Admin::TeacherControllerTest < ActionDispatch::IntegrationTest
  test "should get teachers index" do
    get admin_teacher_index_url
    assert_response :success
  end

  test "should import users from suap" do
    post importar_admin_teacher_index_url, params: {user: 1744888}
    assert_response :redirect
    follow_redirect!
    assert_match 'Professor importado com sucesso', @response.body
  end

  test 'should not import without params' do
    post importar_admin_teacher_index_url
    assert_response :redirect
    follow_redirect!
    assert_match /Erro ao importar dados/, @response.body
  end

end
