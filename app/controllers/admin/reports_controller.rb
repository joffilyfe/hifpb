class Admin::ReportsController < Admin::AdminController
  before_action :set_days, only: [:professor, :sala, :laboratorio]
    
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
    @lessons = Lesson.where(schoolroom: @schoolroom)
    @schedules = CampusSchedule.where(campus: @schoolroom.campus)
  end

  def laboratorio
    @laboratory = Laboratory.find(params[:id])
    @lessons = Lesson.where(laboratory: @laboratory)
    @schedules = CampusSchedule.where(campus: @laboratory.campus)
  end

  def set_days
    @days = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta']  
  end

end
