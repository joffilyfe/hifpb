class Lesson < ApplicationRecord
  belongs_to :classroom
  validates :day, presence: true
  belongs_to :schoolroom, optional: true
  belongs_to :laboratory, optional: true
  belongs_to :campus_schedule
  validates :day, uniqueness: { scope: [:campus_schedule, :classroom], message: "A turma já possui aula neste horário" }
  validates :day, uniqueness: { scope: [:campus_schedule, :schoolroom], message: "Esta sala já está reservada neste horário" }
  validates :day, uniqueness: { scope: [:campus_schedule, :laboratory], message: "Este laboratório já está reservado neste horário" }
  validate :there_must_be_one_of_the_two
  
  def there_must_be_one_of_the_two
    if (schoolroom == nil) && (laboratory == nil)
      errors.add(:Aula, "deve haver um laboratório ou uma sala")
    end
  end
end
