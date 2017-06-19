class Teacher < ApplicationRecord
  validates :registration, :name, :mail, presence: true
  has_many :classrooms
end
