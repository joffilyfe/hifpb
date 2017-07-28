class CourseSubjectPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :course_subject

    def initialize(user, course_subject)
      @user = user
      @course_subject = course_subject
    end

    def resolve
      if user.admin?
        CourseSubject.all
      else
      	CourseSubject.where(course_id: user.courses)
      end
    end
  end

  def index?
    user.permissions.where(:module => "course_subject", :action => "index").any? or user.admin?
  end

  def import?
    user.permissions.where(:module => "course_subject", :action => "import").any? or user.admin?
  end

end
