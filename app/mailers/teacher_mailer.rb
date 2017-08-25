class TeacherMailer < ApplicationMailer
  def turma_email(lesson)
    @lesson   = lesson
    @schedule = lesson.campus_schedule
    @teacher  = @lesson.classroom.teacher
    
    mail(to: @teacher.mail, subject: 'Turma alterada')
  end
end
