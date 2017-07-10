class User < ApplicationRecord
  validates :registration, presence: true, admin: false
  
  def admin?
    admin
  end
end
