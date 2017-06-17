class Admin::CoursesController < Admin::AdminController
  include Admin::ImportHelper

  def show
  	@courses = Course.all.order(:campus_id)
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

    redirect_to action: :show
  end

  private

  def course_params
    params.permit(:id_campus, :ano_letivo, :periodo_letivo)
  end
end
