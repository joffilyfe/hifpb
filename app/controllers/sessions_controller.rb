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
    token = auth(reg, pass)

    if not token.nil?
      user = User.find_or_create_by(registration: reg)
      log_in(user)
      redirect_to admin_path
    else
      flash[:notice] = 'Dados incorretos'
      render :new
    end
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

  private

  def auth(registration, password)
    dados = {"user": registration, "password": password}
    response = request_suap_api({url: 'https://suap.ifpb.edu.br/ldap_backend/auth/', data: dados})

    if response.nil? or response.empty?
      return nil
    end

    return response['token']
  end

end
