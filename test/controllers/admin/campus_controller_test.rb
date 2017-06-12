require 'test_helper'

class Admin::CampusControllerTest < ActionDispatch::IntegrationTest
  test 'should import campus from suap' do
    get importar_campus_admin_campus_url
    assert_redirected_to admin_campus_url

    assert_not_empty Campus.all
  end

  test 'should not duplicate campus in import stage' do
    get importar_campus_admin_campus_url

    count = Campus.count
    get importar_campus_admin_campus_url

    assert_equal count, Campus.count
  end

  test 'should have a success status' do
    get admin_campus_url
    assert_response :success
  end

end
