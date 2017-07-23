class User < ApplicationRecord
  validates :registration, presence: true, admin: false
  has_and_belongs_to_many :permissions

  def admin?
    admin
  end
end
