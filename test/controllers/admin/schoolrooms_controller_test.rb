require 'test_helper'

class Admin::SchoolroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_as_admin
    @admin_schoolroom = schoolrooms(:one)
  end

  test "should get index" do
    get admin_schoolrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_schoolroom_url
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_schoolroom_url(@admin_schoolroom)
    assert_response :success
  end

  test "should create schoolroom" do
    post admin_schoolrooms_url, params: { schoolroom: {name: "Sala-27", initials: "S27", maximum_capacity: "20", amount_resources: "25", campus_id: campus(:campus).id, status: "true"} }
    assert_redirected_to admin_schoolrooms_path
  end

  test "should not create a schoolroom" do
    post admin_schoolrooms_url, params: { schoolroom: {code: 1} }
    assert_no_match 'Sala cadastrada com sucesso', @response.body.to_s
  end

  test "should update schoolroom" do
    patch admin_schoolroom_url(@admin_schoolroom), params: { schoolroom: {name: "Sala-29", initials: "S29", maximum_capacity: "22", amount_resources: "25", campus_id: campus(:campus).id, status: "true"} }
    assert_redirected_to admin_schoolrooms_path
  end

  test "should not update schoolroom" do
    patch admin_schoolroom_url(@admin_schoolroom), params: { schoolroom: {name: "Sala-29", initials: "S29", maximum_capacity: "22", amount_resources: "25", status: "true"} }
    assert_no_match 'Sala atualizada com sucesso', @response.body.to_s
  end

  test "should destroy schoolroom" do
    delete admin_schoolroom_path(schoolrooms(:three))
    assert_redirected_to admin_schoolrooms_path
  end
end
