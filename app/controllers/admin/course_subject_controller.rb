class Admin::CourseSubjectController < Admin::AdminController
  include Admin::ImportHelper

  def index

    if params[:course_id]
      @course_subjects = CourseSubject.where(course_id: params[:course_id]).order(:course_id)
    else
      @course_subjects = CourseSubject.all.includes(:course)
    end
    @courses = Course.all
  end

  def import

    begin
      response = request_suap_api({url: 'https://suap.ifpb.edu.br/edu/api/receber_componentes_curriculares/',
      data: course_subject_params})

      if not response['erro'].nil? or response.empty?
        raise 'ImportError'
      end

      response.each do |pk, subject|
        db_subject = CourseSubject.find_or_create_by(id: pk.to_i)
        db_subject.initials = subject['sigla']
        db_subject.description = subject['descricao']
        db_subject.course_id = course_subject_params[:id_curso].to_i
        db_subject.semester = subject['periodo'].to_i
        db_subject.save
      end

      flash[:success] = "Foram importadas #{response.length} disciplinas com sucesso"
    rescue Exception => e
      Rails.logger.fatal e
      flash[:danger] = 'Erro ao importar dados'
    end

    redirect_to action: :index
  end

  private

  def course_subject_params
    params.permit(:id_curso)
  end
end
