class SemesterPolicy < ApplicationPolicy
  
  def index?
    user.permissions.where(:module => "semester", :action => "index").any? or user.admin?
  end

  def show?
    user.permissions.where(:module => "semester", :action => "show").any? or user.admin?
  end

  def create?
    user.permissions.where(:module => "semester", :action => "create").any? or user.admin?
  end

  def edit?
    user.permissions.where(:module => "semester", :action => "update").any? or user.admin?
  end

  def destroy?
    user.permissions.where(:module => "semester", :action => "delete").any? or user.admin?
  end
end