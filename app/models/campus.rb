class Campus < ApplicationRecord
  validates :description, :sigla, presence: true

  has_many :courses
end
