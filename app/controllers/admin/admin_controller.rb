class Admin::AdminController < ApplicationController
  layout 'admin'
  before_action :logged?
  
  def logged?
    if not logged_in?
      redirect_to "/login"
    end
  end
end
