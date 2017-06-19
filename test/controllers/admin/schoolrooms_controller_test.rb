require 'test_helper'

class Admin::SchoolroomsControllerTest < ActionDispatch::IntegrationTest
  test "should not be saved when already exists initials" do
    # skip
    schoolroom = Schoolroom.new(
      {"name"=>"Sala de aula 01", "maximum_capacity"=>"6", "amount_resources"=>"4", "status"=>"true", "initials"=>"S-01"}
    )
    assert_not schoolroom.save
  end

  test "should not be saved when already exists name" do
    # skip
    schoolroom = Schoolroom.new(
      {"name"=>"Sala-01", "maximum_capacity"=>"6", "amount_resources"=>"4", "status"=>"false", "initials"=>"Sal01"}
    )
    assert_not schoolroom.save
  end
end
