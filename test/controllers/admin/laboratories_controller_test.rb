require 'test_helper'

class Admin::LaboratoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_as_admin
    @admin_lab = laboratories(:one)
  end

  test "should get index" do
    get admin_laboratories_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_laboratory_url
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_laboratory_url(@admin_lab)
    assert_response :success
  end

  test "should create laboratory" do
    post admin_laboratories_url, params: { laboratory: {name: "Sala-27", initials: "S27", maximum_capacity: "20", amount_resources: "25", campus_id: campus(:campus).id, status: "true"} }
    assert_redirected_to admin_laboratories_path
  end

  test "should not create a laboratory" do
    post admin_laboratories_url, params: { laboratory: {code: 1} }
    assert_no_match 'Laboratorio cadastrado com sucesso', @response.body.to_s
  end

  test "should update laboratory" do
    patch admin_laboratory_url(@admin_lab), params: { laboratory: {name: "Sala-29", initials: "S29", maximum_capacity: "22", amount_resources: "25", campus_id: campus(:campus).id, status: "true"} }
    assert_redirected_to admin_laboratories_path
  end

  test "should not update laboratory" do
    patch admin_laboratory_url(@admin_lab), params: { laboratory: {name: "Sala-29", initials: "S29", maximum_capacity: "22", amount_resources: "25", status: "true"} }
    assert_no_match 'Laboratorio atualizado com sucesso', @response.body.to_s
  end

  test "should destroy lesson" do
    delete admin_laboratory_url(laboratories(:three))
    assert_redirected_to admin_laboratories_path
  end
end
