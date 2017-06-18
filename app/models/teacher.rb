class Teacher < ApplicationRecord
  validates :registration, :name, :mail, presence: true
end
