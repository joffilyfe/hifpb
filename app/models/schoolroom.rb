class Schoolroom < ApplicationRecord
  validates :maximum_capacity, :amount_resources, :name, :initials, presence: true
  validates :maximum_capacity, :numericality => { :greater_than_or_equal_to => 0 }
  validates :amount_resources, :numericality => { :greater_than_or_equal_to => 0 }
  validate :exist_other_with_this_initials
  validate :exist_other_with_this_name
  has_many :lessons
  has_many :reservation
  belongs_to :campus

  def to_s
    if (self.name == nil)
        "  -  "
    else  "#{self.name}"
    end
  end

  def exist_other_with_this_initials
    @schoolrooms = Schoolroom.all
    unless initials.nil?
    @schoolrooms.each { |s|
      unless s.id == id
        errors.add(:initials, 'Outra sala já possui sigla informada') if s.initials.casecmp(initials) == 0
      end
    }
    end
  end

  def exist_other_with_this_name
    @schoolrooms = Schoolroom.all
    unless name.nil?
    @schoolrooms.each { |s|
      unless s.id == id
        errors.add(:initials, 'Outra sala já possui nome informado') if s.name.casecmp(name) == 0
      end
    }
    end
  end
end
