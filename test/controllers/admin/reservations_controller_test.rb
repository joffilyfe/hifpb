require 'test_helper'

class Admin::ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
    sign_as_admin
  end

  test "should get index" do
    get admin_reservations_path
    assert_response :success
  end

  test "should get new" do
    get new_admin_reservation_path
    assert_response :success
  end

  test "should create reservation" do
      post admin_reservations_path, params: { reservation: { schoolroom_id: schoolrooms(:two).id,laboratory_id: nil,date_reservation:'13-10-2017',campus_schedule_id: campus_schedules(:one).id } }
      assert_redirected_to admin_reservations_path
  end

  test "should not create a lesson without schoolroom and laboratory" do
    post admin_reservations_path, params: {reservation: { schoolroom_id: schoolrooms(:two).id,laboratory_id: nil,date_reservation:'11-10-2017',campus_schedule_id: campus_schedules(:one).id } }
    assert_no_match 'Reserva criada com sucesso.', @response.body.to_s
  end
end
