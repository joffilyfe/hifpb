class Admin::CoursesController < Admin::AdminController
  include Admin::ImportHelper
  before_action :set_authorization, only: [:index, :import]

  def index
    if params[:campus_id]
      @courses = policy_scope(Course).where(campus_id: params[:campus_id]).order(:campus_id)
    else
      @courses = policy_scope(Course).order(:campus_id)
    end
    @campus = Campus.all
  end

  def import
    response = request_suap_api({url: 'https://suap.ifpb.edu.br/edu/api/receber_cursos/',
    data: course_params})

    if response['erro'].nil?
      response.each do |pk, course|
        db_course = Course.find_or_create_by(id: pk.to_i)
        db_course.name = course['nome']
        db_course.description = course['descricao']
        db_course.code = course['codigo'].to_i
        db_course.campus_id = course_params[:id_campus].to_i
        db_course.save
      end
      flash[:success] = "Foram importados #{response.length} cursos com sucesso"
    else
      flash[:danger] = "Erro ao importar dados"
    end

    redirect_to action: :index
  end

  private
  def set_authorization
    authorize Course
  end

  def course_params
    params.permit(:id_campus, :ano_letivo, :periodo_letivo)
  end
end
