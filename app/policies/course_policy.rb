class CoursePolicy < ApplicationPolicy

  class Scope < Scope
    attr_reader :user, :course

    def initialize(user, course)
      @user = user
      @course = course
    end

    def resolve
      if user.admin?
        Course.all
      else
        Course.where(id: user.courses)
      end
    end
  end

  def index?
    user.permissions.where(:module => "course", :action => "show").any? or user.admin?
  end

  def import?
    user.permissions.where(:module => "course", :action => "import").any? or user.admin?
  end
end
