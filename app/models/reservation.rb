
class Reservation < ApplicationRecord
  validates :date_reservation, presence: true
  belongs_to :schoolroom, optional: true
  belongs_to :laboratory, optional: true
  belongs_to :campus_schedule
  validate :can_not_reservation_schedule_twice
  validate :can_not_reservation_lesson_schedule_twice
  validate :there_must_be_one_of_the_two
  validate :can_not_make_reservation_less_than_24_hours


  def there_must_be_one_of_the_two
    if (schoolroom == nil) && (laboratory == nil)
      errors.add(:Reserva, "deve haver um laboratório ou uma sala")
    end
  end



  def can_not_reservation_lesson_schedule_twice

    if (date_reservation != nil)
      I18n.locale = "pt-BR"
      dia = I18n.t(:"date.day_names")[date_reservation.wday]
    end
      @lessons = Lesson.all
      @lessons.each{ |l|
        if ((l.day == dia) && (l.campus_schedule_id == campus_schedule_id))
                    if ((l.laboratory_id == laboratory_id) && (l.schoolroom_id == schoolroom_id)) ||
                    ((l.laboratory_id == nil) && (l.schoolroom_id == schoolroom_id)) ||
                    ((l.laboratory_id == laboratory_id) && (l.schoolroom_id == nil)) ||
                    ((l.laboratory_id == laboratory_id) && (l.schoolroom_id != schoolroom_id)) ||
                    ((l.laboratory_id != laboratory_id) && (l.schoolroom_id == schoolroom_id))

                        errors.add(:Falha,", já existe uma aula reservada para este horario e dia")

                    end
        end
      }

  end

  def can_not_reservation_schedule_twice

      @reservations = Reservation.all

        @reservations.each{ |r|
          if ((r.date_reservation == date_reservation) && (r.campus_schedule_id == campus_schedule_id))
                    if ((r.laboratory_id == laboratory_id) && (r.schoolroom_id == schoolroom_id)) ||
                    ((r.laboratory_id == nil) && (r.schoolroom_id == schoolroom_id)) ||
                    ((r.laboratory_id == laboratory_id) && (r.schoolroom_id == nil)) ||
                    ((r.laboratory_id == laboratory_id) && (r.schoolroom_id != schoolroom_id)) ||
                    ((r.laboratory_id != laboratory_id) && (r.schoolroom_id == schoolroom_id))

                    errors.add(:Falha,", já existe uma reserva feita para este dia")

                    end
          end
        }
  end


  def can_not_make_reservation_less_than_24_hours

      if (date_reservation.to_s == Date.today.to_s)

          errors.add(:Falha,", não é possível reservar com menos de 24 horas de antecedência")

      end
  end


end
