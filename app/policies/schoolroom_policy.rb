class SchoolroomPolicy < ApplicationPolicy
  def index?
    user.permissions.where(:module => "schoolroom", :action => "index").any? or user.admin?
  end

  def show?
    user.permissions.where(:module => "schoolroom", :action => "show").any? or user.admin?
  end

  def create?
    user.permissions.where(:module => "schoolroom", :action => "create").any? or user.admin?
  end

  def edit?
    user.permissions.where(:module => "schoolroom", :action => "update").any? or user.admin?
  end

  def destroy?
    user.permissions.where(:module => "schoolroom", :action => "delete").any? or user.admin?
  end

end