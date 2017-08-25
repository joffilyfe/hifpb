require 'test_helper'

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should select a campus" do
    campus = campus(:campus)
    get set_campi_path(campus: campus.id)
    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
    assert_match /JOAO PESSOA/, @response.body
  end
end
