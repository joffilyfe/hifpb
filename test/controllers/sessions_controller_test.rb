require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should redirect to admin path" do
    sign_as_admin
    get login_url
    assert_response :redirect
    assert_redirected_to admin_path
  end

  test "should registrate a user" do
    skip
    post login_url, params: {session: {matricula: ENV['SUAP_USER'], password: ENV['SUAP_PASSWORD']}}
    assert_redirected_to admin_path
  end

  test "should not registrate a new user" do
    post login_url, params: {session: {matricula: '1', password: '1'}}
    assert_response :success
    assert_equal 'Dados incorretos', flash[:notice]
  end

  test "should logout user" do
    get logout_url
    assert_redirected_to login_url
    get admin_path
    assert_redirected_to login_url
  end
end
