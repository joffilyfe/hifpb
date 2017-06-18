class Semester < ApplicationRecord
  validates :year, :semester, :start_date, :end_date, presence: true
  validate :start_date_before_end_date
  validate :is_in_valid_date
  validate :dates_in_accordance_with_other_semesters

  def start_date_before_end_date
    if (start_date.nil? && end_date.nil?) == false
      errors.add(:Inicio, 'deve ser menor que a data de Terminio') if start_date > end_date
    end
  end

  def is_in_valid_date
    @semesters = Semester.all
      if (start_date.nil? && end_date.nil?) == false
        @semesters.each { |s|
          errors.add(:Termino, ': Data já faz parte de outro semestre') if end_date.between?(s.start_date, s.end_date)
          errors.add(:Inicio, ': Data já faz parte de outro semestre') if start_date.between?(s.start_date, s.end_date)
        }
      end
  end

  def dates_in_accordance_with_other_semesters
    @semesters = Semester.all
    if (year.nil? && semester.nil?) == false
      @semesters.each { |s|
        if (year + semester).to_i > s.id
          errors.add(:Inicio, 'do Semestre deve ser maior que '+s.end_date.strftime("%d/%b/%Y")) if start_date < s.end_date
        elsif (year + semester).to_i < s.id
          errors.add(:Termino, 'do Semestre deve ser menor que '+s.start_date.strftime("%d/%b/%Y")) if end_date > s.start_date
        end
      }
    end
  end
end
