require 'test_helper'

class Admin::ImportControllerTest < ActionDispatch::IntegrationTest


  test 'should import campus from suap' do
    get admin_importar_campus_url
    assert_response :success

    assert_not_empty Campus.all
  end

  test 'should not duplicate campus in import stage' do
    get admin_importar_campus_url

    count = Campus.count
    get admin_importar_campus_url

    assert_equal count, Campus.count
  end

end
