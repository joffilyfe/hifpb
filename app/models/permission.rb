class Permission < ApplicationRecord
  validates :title, :module, :action, presence: true
  validates :title, length: { minimum: 8 }

  has_and_belongs_to_many :users
end
