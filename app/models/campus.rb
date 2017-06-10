class Campus < ApplicationRecord
  validates :description, :sigla, presence: true
end
