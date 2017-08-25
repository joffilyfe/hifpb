class Schedule::SchoolroomController < SiteController
  def index
    @rooms = Schoolroom.where(campus: get_campi).order(name: :asc)
  end

  def show
    @lessons = Lesson.by_schoolroom(params[:room])
    @schedules = CampusSchedule.where(campus: get_campi).order(:shift)
  end
end
