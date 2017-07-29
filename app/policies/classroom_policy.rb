class ClassroomPolicy < ApplicationPolicy

  class Scope < Scope
    attr_reader :user, :classrooms

    def initialize(user, classrooms)
      @user = user
      @classrooms = classrooms
    end

    def resolve
      if user.admin?
        Classroom.all
      else
        Classroom.where(course_id: user.courses)
      end
    end
  end

  def index?
    user.permissions.where(:module => "classroom", :action => "index").any? or user.admin?
  end

  def new?
    user.permissions.where(:module => "classroom", :action => "new").any? or user.admin?
  end

  def show?
    user.permissions.where(:module => "classroom", :action => "show").any? or user.admin?
  end

  def create?
    user.permissions.where(:module => "classroom", :action => "create").any? or user.admin?
  end

  def update?
    user.permissions.where(:module => "classroom", :action => "update").any? or user.admin?
  end

  def edit?
    user.permissions.where(:module => "classroom", :action => "edit").any? or user.admin?
  end

  def destroy?
    user.permissions.where(:module => "classroom", :action => "delete").any? or user.admin?
  end

end
