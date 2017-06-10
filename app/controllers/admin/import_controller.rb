class Admin::ImportController < Admin::AdminController

  include Admin::ImportHelper

  def campus
    response = request_suap_api({url: 'https://suap.ifpb.edu.br/edu/api/receber_campus/'})

    response.each do |pk, campi|
      campus = Campus.find_or_create_by(id: pk.to_i)
      campus.description = campi['descricao']
      campus.sigla = campi['sigla']

      campus.save
    end

    flash[:success] = 'Dados importados com sucesso'
    render json: response
  end

  def courses
    response = request_suap_api({url: 'https://suap.ifpb.edu.br/edu/api/receber_cursos/',
      data: course_params})

    response.each do |pk, course|
      db_course = Course.find_or_create_by(id: pk.to_i)
      db_course.name = course['nome']
      db_course.description = course['descricao']
      db_course.code = course['codigo'].to_i
      db_course.campus_id = course_params[:id_campus].to_i
      db_course.save
    end

    render json: response
  end


  private

  def course_params
    params.permit(:id_campus, :ano_letivo, :periodo_letivo)
  end
end
