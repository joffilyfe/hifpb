class CourseSubject < ApplicationRecord
  belongs_to :course
  validates :initials, :description, :semester, presence: true
  has_many :classrooms

  def self.semester_by_course(course)
    where(course: course).map { |subject| subject.semester }.uniq.sort.delete_if{|i|i==0}
  end
end
