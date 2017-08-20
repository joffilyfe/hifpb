class SiteController < ApplicationController

  before_action :set_semester, :set_days, :set_campus

  def index
  end

  def set_campi
    session[:campus_id] = params[:campus]
    redirect_to params[:next] || root_path
  end

  private
  def get_campi
    session[:campus_id] || 3
  end

  def set_campus
    @campus = Campus.all
  end

  def set_semester
    @current_semester = Semester.where(status: true).last
  end

  def set_days
    @days = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta']
  end
end
