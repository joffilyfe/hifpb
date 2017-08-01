require 'test_helper'

class SchoolroomTest < ActiveSupport::TestCase

  test 'should be not saved without args' do
    # skip
    schoolroom = Schoolroom.new
    assert_not schoolroom.save
  end

  test 'should be not saved when some schoolroom use name' do
    # skip
    schoolroom = Schoolroom.new({name: "Sala-01", initials: "Sala", maximum_capacity: "20", amount_resources: "25", campus_id: "3", status: "true"})
    assert_not schoolroom.save
  end

  test 'should be not saved when some schoolroom use initials' do
    # skip
    schoolroom = Schoolroom.new({name: "awesome-schoolroom", initials: "Sala-01", maximum_capacity: "20", amount_resources: "25", campus_id: "3", status: "true"})
    assert_not schoolroom.save
  end
end
