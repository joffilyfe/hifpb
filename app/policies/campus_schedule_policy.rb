class CampusSchedulePolicy < ApplicationPolicy
  def index?
    user.permissions.where(:module => "campus_schedule", :action => "index").any? or user.admin?
  end

  def new?
    user.permissions.where(:module => "campus_schedule", :action => "show").any? or user.admin?
  end

  def create?
    user.permissions.where(:module => "campus_schedule", :action => "create").any? or user.admin?
  end

  def destroy?
    user.permissions.where(:module => "campus_schedule", :action => "delete").any? or user.admin?
  end
end
