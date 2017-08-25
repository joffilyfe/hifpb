class Admin::TeacherController < Admin::AdminController
  include Admin::ImportHelper

  def index
    authorize Teacher
    @teachers = Teacher.all.paginate :page => params[:page], :per_page => 10
  end

  def import
    authorize Teacher
    begin
      response = request_suap_api({url: 'https://suap.ifpb.edu.br/ldap_backend/info/',
        data: teacher_params})

      if not response['erro'].nil? or response.empty?
        raise 'ImportError'
      end

      teacher = Teacher.find_or_create_by(registration: teacher_params[:user].to_i)
      teacher.name = response['displayName'].first
      teacher.mail = response['mail'].first
      teacher.campus = response['extensionAttribute1'].first
      teacher.department = response['department'].first
      teacher.save

      flash[:success] = "Professor importado com sucesso"
    rescue Exception => e
      Rails.logger.fatal e
      flash[:danger] = 'Erro ao importar dados'
    end

    redirect_to action: :index
  end

  private

  def teacher_params
    params.permit(:user)
  end
end
