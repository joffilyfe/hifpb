class Admin::CampusController < Admin::AdminController

  include Admin::ImportHelper

  def index
    authorize Campus
    @campus = Campus.all.order(id: :asc).paginate :page => params[:page], :per_page => 10
  end

  def import
    authorize Campus
    response = request_suap_api({url: 'https://suap.ifpb.edu.br/edu/api/receber_campus/'})

    response.each do |pk, campi|
      campus = Campus.find_or_create_by(id: pk.to_i)
      campus.description = campi['descricao']
      campus.sigla = campi['sigla']

      campus.save
    end

    flash[:success] = 'Dados importados com sucesso'
    redirect_to action: :index
  end
end
