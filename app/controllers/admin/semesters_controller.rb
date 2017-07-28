class Admin::SemestersController < Admin::AdminController
  include Admin::ImportHelper

  def index
    @semesters = Semester.all.order(year: :desc)
  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.new semester_params
    @semester.id = (@semester.year + @semester.semester).to_i

    if @semester.valid?
      @semester.save
      redirect_to admin_semesters_path
    else
      flash[:error] = @semester.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
    @semester = Semester.find(params[:id])
  end

  def update
    @semester = Semester.find(params[:id])
    if @semester.update(semester_params)
      redirect_to admin_semesters_path
    else
      flash[:danger] = @semester.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @semester = Semester.find(params[:id])
    @semester.destroy

    redirect_to admin_semesters_path
  end

  private
  def semester_params
    params.require(:semester).permit(:year, :semester, :status)
  end

end
