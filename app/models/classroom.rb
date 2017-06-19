class Classroom < ApplicationRecord
  belongs_to :course
  belongs_to :course_subject
  belongs_to :teacher
end
