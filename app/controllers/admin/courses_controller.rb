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
        case course['nome']
          when /CURSOS SUPERIOR [^EM T]*/
            nome = course['nome'].remove('CURSO SUPERIOR EM ')
          when /CURSO SUPERIOR DE TECNOLOGIA EM/
            nome = course['nome'].remove('CURSO SUPERIOR DE TECNOLOGIA EM ')
          when /TÉCNICO EM/
            nome = course['nome'].remove('TÉCNICO EM ')
          when /CURSO DE ESPECIALIZAÇÃO EM/
            nome = course['nome'].remove('CURSO DE ESPECIALIZAÇÃO EM ')
          when /CURSO SUPERIOR DE BACHARELADO EM /
            nome = course['nome'].remove('CURSO SUPERIOR DE BACHARELADO EM ')
          when /CURSO TÉCNICO EM/
            nome = course['nome'].remove('CURSO TÉCNICO EM ')
          else
            nome = course['nome']
        end

        case nome
          when /-/
            nome = nome.split("-")[0]
        end

        db_course.name = nome.downcase
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
