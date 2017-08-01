class Campus < ApplicationRecord
  validates :description, :sigla, presence: true

  has_many :courses
  has_many :schoolrooms
  has_many :laboratories
end
