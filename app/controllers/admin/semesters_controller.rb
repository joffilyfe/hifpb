class Admin::SemestersController < Admin::AdminController
  include Admin::ImportHelper
  before_action :set_semester, only: [:show, :edit, :update, :destroy]
  before_action :set_authorization, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @semesters = Semester.all.order(year: :desc).paginate :page => params[:page], :per_page => 10
  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.new semester_params
    @semester.id = (@semester.year + @semester.semester).to_i

    if @semester.valid? and @semester.save
      redirect_to admin_semesters_path, notice: 'Semestre criado com sucesso'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @semester.update(semester_params)
      redirect_to admin_semesters_path, notice: 'Semestre atualizado com sucesso'
    else
      flash[:danger] = @semester.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @semester.destroy
    redirect_to admin_semesters_path, notice: 'Semestre removido com sucesso'
  end

  def set_semester
    @semester = Semester.find(params[:id])
  end

  def set_authorization
    authorize Semester
  end

  private
  def semester_params
    params.require(:semester).permit(:year, :semester, :status)
  end

end
