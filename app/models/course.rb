class Course < ApplicationRecord
  validates :name, :description, :code, presence: true
  belongs_to :campus
end
