class Schedule::TeacherController < SiteController
  def index
    @teachers = Teacher.all
  end

  def show
    @lessons = Lesson.by_teacher(params[:teacher]).by_campus(get_campi)
    @schedules = CampusSchedule.where(campus: get_campi).order(:shift)
  end
end
