class Schedule::LaboratoryController < SiteController
  def index
    @labs = Laboratory.where(campus: get_campi)
  end

  def show
    @lessons = Lesson.by_laboratory(params[:lab])
    @schedules = CampusSchedule.where(campus: get_campi).order(:shift)
  end
end
