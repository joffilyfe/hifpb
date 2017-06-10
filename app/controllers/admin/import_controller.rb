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

end
