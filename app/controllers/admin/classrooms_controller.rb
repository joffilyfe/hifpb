class Admin::ClassroomsController < Admin::AdminController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  before_action :set_authorization, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  def index
    if params[:course_id]
      @classrooms = policy_scope(Classroom).where(course_id: params[:course_id])
    else
      @classrooms = policy_scope(Classroom).order(:course_id)
    end
  end

  def show
    if @classrooms.exclude?(@classroom)
      redirect_to admin_classrooms_path
    else
      if params[:course_id]
        @classrooms = policy_scope(Classroom.where(course_id: params[:course_id]))
      else
        @classrooms = policy_scope(Classroom)
      end
    end
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end

  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to admin_classroom_path(@classroom), notice: 'Turma criada com sucesso' }
        format.json { render :show, status: :created, location: @classroom }
      else
        format.html { render :new }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to admin_classroom_path(@classroom), notice: 'Turma atualizada com sucesso' }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to admin_classrooms_url, notice: 'Turma excluída com sucesso' }
      format.json { head :no_content }
    end
  end

  private
  def set_authorization
    authorize Classroom
  end

  def set_classroom
    @classrooms = policy_scope(Classroom)
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:name, :code, :course_id, :course_subject_id, :teacher_id, :semester_id)
  end
end
