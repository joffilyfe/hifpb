class SessionsController < ApplicationController
  include Admin::ImportHelper

  def new
    if logged_in?
      redirect_to "/admin"
    end
  end

  def create
    reg = params[:session][:matricula]
    pass = params[:session][:password]
    token = auth reg, pass

    unless token.nil?
      user = User.find_by(registration: reg)
      if user.nil?
        user = User.new(registration: reg)
        user.save
      end

      # autho = Authorization.find_by(user: user)
      if not user.nil? or user.admin?
        log_in user
        redirect_to "/admin"
      else
        flash.now[:notice] = "Permissão negada"
        render 'new'
      end
    else
      flash.now[:notice] = "Dados inválidos"
      render 'new'
    end
  end

  def auth(registation, password)
    dados = {"user": registation, "password": password}
    response = request_suap_api({url: 'https://suap.ifpb.edu.br/ldap_backend/auth/', data: dados})

    if response.nil? or response.empty?
      return nil
    end

    return response['token']
  end

  def destroy
    log_out
    redirect_to "/login"
  end

  def mock_login
    if ENV['RAILS_ENV'] == 'test'
      user = User.find_or_create_by(registration: params[:registration])

      if (params[:admin])
        user.admin = true
        user.save
      end

      log_in(user)

      redirect_to admin_path
    end
  end

end
