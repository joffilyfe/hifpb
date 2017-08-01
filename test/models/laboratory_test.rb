require 'test_helper'

class LaboratoryTest < ActiveSupport::TestCase

  test 'should be not saved without args' do
    laboratory = Laboratory.new
    assert_not laboratory.save
  end

  test 'should be not saved when some laboratory use name' do
    laboratory = Laboratory.new({name: "Sala-01", initials: "Sala", maximum_capacity: "20", amount_resources: "25", campus_id: "3", status: "true"})
    assert_not laboratory.save
  end

  test 'should be not saved when some laboratory use initials' do
    laboratory = Laboratory.new({name: "awesome-laboratory", initials: "Sala-01", maximum_capacity: "20", amount_resources: "25", campus_id: "3", status: "true"})
    assert_not laboratory.save
  end
end
