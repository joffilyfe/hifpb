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
      @campus << l.laboratory.campus if not l.laboratory.nil?
      @campus << l.schoolroom.campus if not l.schoolroom.nil?
    end
    @campus = @campus.uniq
    @schedules = CampusSchedule.where(campus: @campus.first)
  end

  def sala
    @schoolroom = Schoolroom.find(params[:id])
    @lessons = Lesson.where(schoolroom: @schoolroom)
    @campus = @schoolroom.campus
  end

  def laboratorio
    @laboratory = Laboratory.find(params[:id])
    @lessons = Lesson.where(laboratory: @laboratory)
    @campus = @laboratory.campus
  end

  def set_days
    @days = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta']  
  end
end
