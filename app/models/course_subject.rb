class CourseSubject < ApplicationRecord
  belongs_to :course
  validates :initials, :description, :semester, presence: true
end
