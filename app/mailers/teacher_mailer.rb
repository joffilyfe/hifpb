class TeacherMailer < ApplicationMailer
  def aula_email(lesson)
    @lesson   = lesson
    @schedule = lesson.campus_schedule
    @teacher  = @lesson.classroom.teacher
    
    mail(to: @teacher.mail, subject: 'Aula alterada')
  end
end
