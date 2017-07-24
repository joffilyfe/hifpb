class CampusPolicy < ApplicationPolicy

  def index?
    user.permissions.where(:module => "campus", :action => "index").any? or user.admin?
  end

  def import?
    user.permissions.where(:module => "campus", :action => "import").any? or user.admin?
  end
end
