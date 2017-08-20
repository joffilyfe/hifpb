class Laboratory < ApplicationRecord
  validates :maximum_capacity, :amount_resources, :name, :initials, presence: true
  validates :maximum_capacity, :numericality => { :greater_than_or_equal_to => 0 }
  validates :amount_resources, :numericality => { :greater_than_or_equal_to => 0 }
  validate :exist_other_with_this_initials
  validate :exist_other_with_this_name
  has_many :lessons
  has_many :reservation
  belongs_to :campus

  def exist_other_with_this_initials
    @laboratories = Laboratory.all
    unless initials.nil?
    @laboratories.each { |l|
      unless l.id == id
        errors.add(:initials, 'Outro laboratório já possui sigla informada') if l.initials.casecmp(initials) == 0
      end
    }
    end
  end

  def exist_other_with_this_name
    @laboratories = Laboratory.all
    unless name.nil?
    @laboratories.each { |l|
      unless l.id == id
        errors.add(:initials, 'Outro laboratório já possui nome informada') if l.name.casecmp(name) == 0
      end
    }
    end
  end
end
