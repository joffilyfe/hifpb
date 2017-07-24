class CourseSubjectPolicy < ApplicationPolicy

  def index?
    user.permissions.where(:module => "course_subject", :action => "index").any? or user.admin?
  end

  def import?
    user.permissions.where(:module => "course_subject", :action => "import").any? or user.admin?
  end

end
