class Permission < ApplicationRecord
  validates :title, :module, :action, presence: true
  validates :title, length: { minimum: 8 }
end
