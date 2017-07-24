class ClassroomPolicy < ApplicationPolicy

  def index?
    user.permissions.where(:module => "classroom", :action => "index").any? or user.admin?
  end

  def show?
    user.permissions.where(:module => "classroom", :action => "show").any? or user.admin?
  end

  def create?
    user.permissions.where(:module => "classroom", :action => "create").any? or user.admin?
  end

  def edit?
    user.permissions.where(:module => "classroom", :action => "update").any? or user.admin?
  end

  def destroy?
    user.permissions.where(:module => "classroom", :action => "delete").any? or user.admin?
  end

end
