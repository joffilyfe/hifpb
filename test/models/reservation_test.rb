require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  test "can_not_reservation_lesson_schedule_twice" do
    skip
    reservation = Reservation.new(
      {"schoolroom"=>schoolrooms(:one),"laboratory"=>laboratories(:one),"date_reservation"=>'2017-11-27',"campus_schedule"=> campus_schedules(:one)}
    )
    assert_not reservation.save
  end

  test "can_not_reservation_schedule_twice" do
    # skip
    reservation = Reservation.new(
      {"schoolroom"=>schoolrooms(:two),"laboratory"=>laboratories(:two),"date_reservation"=>'18-08-2017',"campus_schedule"=> campus_schedules(:two)}
    )
    assert_not reservation.save
  end

   test "can_not_make_reservation_less_than_24_hours" do
    # skip
    reservation = Reservation.new(
      {"schoolroom"=>nil,"laboratory"=>laboratories(:two),"date_reservation"=>'19-08-2017',"campus_schedule"=> campus_schedules(:one)}
    )
    assert_not reservation.save
  end
end
