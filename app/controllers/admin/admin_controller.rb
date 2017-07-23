class Admin::AdminController < ApplicationController
  include Pundit
  protect_from_forgery

  layout 'admin'
  before_action :logged?

  def logged?
    if not logged_in?
      redirect_to "/login"
    end
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não possui permissão para realizar essa operação"
    redirect_to(request.referrer || admin_path)
  end
end
