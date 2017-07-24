class LaboratoryPolicy < ApplicationPolicy
  
  def index?
    user.permissions.where(:module => "laboratory", :action => "index").any? or user.admin?
  end

  def show?
    user.permissions.where(:module => "laboratory", :action => "show").any? or user.admin?
  end

  def create?
    user.permissions.where(:module => "laboratory", :action => "create").any? or user.admin?
  end

  def edit?
    user.permissions.where(:module => "laboratory", :action => "update").any? or user.admin?
  end

  def destroy?
    user.permissions.where(:module => "laboratory", :action => "delete").any? or user.admin?
  end
end