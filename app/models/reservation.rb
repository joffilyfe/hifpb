
class Reservation < ApplicationRecord
  validates :date_reservation, presence: true
  belongs_to :schoolroom, optional: true
  belongs_to :laboratory, optional: true
  belongs_to :campus_schedule
  validate :can_not_reservation_schedule_twice

  validate :there_must_be_one_of_the_two
  validate :can_not_make_reservation_less_than_24_hours


  def there_must_be_one_of_the_two
    if (schoolroom == nil) && (laboratory == nil)
      errors.add(:Reserva, "deve haver um laboratório ou uma sala")
    end
  end



  def can_not_reservation_lesson_schedule_twice
    dia = ''
    if (date_reservation != nil)
    dia = Date::DAYNAMES[date_reservation.wday]
    end
      @lessons = Lesson.all

      errors.add(:Falha,dia)
  end

  def can_not_reservation_schedule_twice

      @reservations = Reservation.all

        @reservations.each{ |r|
          if ((r.date_reservation == date_reservation) && (r.campus_schedule_id == campus_schedule_id) && ((r.laboratory_id == laboratory_id) && (r.schoolroom_id == schoolroom_id))) ||
             ((r.date_reservation == date_reservation) && (r.campus_schedule_id == campus_schedule_id) && ((r.laboratory_id == nil) && (r.schoolroom_id == schoolroom_id))) ||
             ((r.date_reservation == date_reservation) && (r.campus_schedule_id == campus_schedule_id) && ((r.laboratory_id == laboratory_id) && (r.schoolroom_id == nil))) ||
             ((r.date_reservation == date_reservation) && (r.campus_schedule_id == campus_schedule_id) && ((r.laboratory_id == laboratory_id) && (r.schoolroom_id != schoolroom_id))) ||
             ((r.date_reservation == date_reservation) && (r.campus_schedule_id == campus_schedule_id) && ((r.laboratory_id != laboratory_id) && (r.schoolroom_id == schoolroom_id)))
            errors.add(:Falha,", já existe uma reserva feita para este dia")
          end
        }
  end


  def can_not_make_reservation_less_than_24_hours

      if (date_reservation.to_s == Date.today.to_s)

          errors.add(:Falha,", não é possível reservar com menos de 24 horas de antecedência")

      end
  end


end
