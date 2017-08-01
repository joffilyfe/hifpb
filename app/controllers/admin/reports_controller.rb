class Admin::ReportsController < Admin::AdminController
  def index

  end

  def professores
    @teachers = Teacher.all
  end

  def salas
    @schoolrooms = Schoolroom.all
  end

  def laboratorios
    @laboratories = Laboratory.all
  end

  def professor
    # TO DO
  end

  def sala
    @schoolroom = Schoolroom.find(params[:id])
    @monday = Lesson.where(schoolroom: @schoolroom, day: 'Segunda')
    @tuesday = Lesson.where(schoolroom: @schoolroom, day: 'Terça')
    @wednesday = Lesson.where(schoolroom: @schoolroom, day: 'Quarta')
    @thursday = Lesson.where(schoolroom: @schoolroom, day: 'Quinta')
    @friday = Lesson.where(schoolroom: @schoolroom, day: 'Sexta')
    @campus_schedules = CampusSchedule.where(campus: @schoolroom.campus)
  end

  def laboratorio
    @laboratory = Laboratory.find(params[:id])
    @monday = Lesson.where(laboratory: @laboratory, day: 'Segunda')
    @tuesday = Lesson.where(laboratory: @laboratory, day: 'Terça')
    @wednesday = Lesson.where(laboratory: @laboratory, day: 'Quarta')
    @thursday = Lesson.where(laboratory: @laboratory, day: 'Quinta')
    @friday = Lesson.where(laboratory: @laboratory, day: 'Sexta')
    @campus_schedules = CampusSchedule.where(campus: @laboratory.campus)
  end

end
