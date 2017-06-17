require 'test_helper'

class CourseSubjectTest < ActiveSupport::TestCase

	test 'should not create an invalid course subject' do
		subject = CourseSubject.new
		assert_not subject.valid?
	end

	test 'should create a valid course subject' do
		subject = course_subjects(:course_subject)
		assert subject.valid?
	end
end
