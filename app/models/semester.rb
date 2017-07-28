class Semester < ApplicationRecord
  validates :year, :semester, presence: true
  validates :year, uniqueness: { scope: :semester, message: "should not have same year and semester together" }
  has_many :classrooms

  def to_s
    "#{year}.#{semester}"
  end
end
