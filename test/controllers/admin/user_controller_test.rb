require 'test_helper'

class Admin::UserControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user_a)
    @permission = permissions(:one)
    @course = courses(:tsi)
  end

  test 'should enter in user index' do
  	sign_as_admin
  	get admin_user_index_url
  	assert_response :success
  end

  test 'should enter in edit user page' do
  	sign_as_admin
  	get edit_admin_user_url(@user)
  	assert_response :success
  end

  test 'should update user permissions' do
  	sign_as_admin
  	patch admin_user_url(@user), params: { user: {"permission_ids"=>[@permission.id], "course_ids"=>[@course.id]} }
    assert_no_match 'Usuário atualizado com sucesso', @response.body
  end

  test 'should no update user permissions without login as admin' do
  	patch admin_user_url(@user), params: { user: {"permission_ids"=>[@permission.id], "course_ids"=>[@course.id]} } 	
  	assert_response :redirect
  	follow_redirect!
    assert_no_match 'Usuário atualizado com sucesso', @response.body
  end
end
