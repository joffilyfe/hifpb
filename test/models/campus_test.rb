require 'test_helper'

class CampusTest < ActiveSupport::TestCase

  test 'should not create a invalid campus' do
    campus = Campus.new
    assert_not campus.valid?
  end

  test 'should create a valid course' do
    campus = campus(:campus)
    assert campus.valid?
    assert 'CAMPUS-JP' == campus.sigla
  end

end
