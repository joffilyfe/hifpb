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
    @teacher = Teacher.find(params[:id])
    @classrooms = Classroom.where(teacher: @teacher)
    @lessons = Lesson.where(classroom: @classrooms)
    @campus = []
    @lessons.each do |l|
      # Fix this!!!
      @campus << l.laboratory.nil? ? l.schoolroom.campus.description : l.laboratory.campus.description
    end
    @schedules = CampusSchedule.where(campus: @campus)
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
