class Semester < ApplicationRecord
  validates :year, :semester, presence: true, on: :create
  validates :year, uniqueness: { scope: :semester, message: "should not have same year and semester togeter" }
  has_many :classrooms

  def to_s
    "#{year}.#{semester}"
  end
end
