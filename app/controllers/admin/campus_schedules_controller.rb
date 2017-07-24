class Admin::CampusSchedulesController < Admin::AdminController
  before_action :set_campus_schedule, only: [:show, :destroy]

  def index
    authorize CampusSchedule
    @campus = Campus.find(params[:campus_id])
    @campus_schedules = CampusSchedule.where(campus: @campus).order([:start, :end])
  end

  def new
    @campus = Campus.find(params[:campus_id])
    @campus_schedule = CampusSchedule.new(campus: @campus)
  end

  def create
    authorize CampusSchedule
    @campus = Campus.find(params[:campus_id])
    @campus_schedule = CampusSchedule.new(campus_schedule_params)
    @campus_schedule.campus = @campus

    respond_to do |format|
      if @campus_schedule.save
        format.html { redirect_to admin_campus_campus_schedules_path(@campus_schedule.campus), notice: 'Horário criado com sucesso' }
      else
        format.html { render 'admin/campus_schedules/new', campus_schedule: @campus_schedule }
      end
    end
  end

  def destroy
    authorize CampusSchedule
    @campus_schedule.destroy
    respond_to do |format|
      format.html { redirect_to admin_campus_campus_schedules_url(@campus), notice: 'Horário removido com sucesso' }
      format.json { head :no_content }
    end
  end

  private

    def set_campus_schedule
      @campus_schedule = CampusSchedule.find(params[:id])
      @campus = Campus.find(params[:campus_id])
    end

    def campus_schedule_params
      params.require(:campus_schedule).permit(:shift, :start, :end)
    end
  end
