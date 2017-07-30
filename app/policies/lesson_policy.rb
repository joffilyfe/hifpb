class LessonPolicy < ApplicationPolicy
  def index?
    user.permissions.where(:module => "lesson", :action => "index").any? or user.admin?
  end

  def create?
    user.permissions.where(:module => "lesson", :action => "create").any? or user.admin?
  end

  def update?
    user.permissions.where(:module => "lesson", :action => "update").any? or user.admin?
  end

  def destroy?
    user.permissions.where(:module => "lesson", :action => "destroy").any? or user.admin?
  end
end