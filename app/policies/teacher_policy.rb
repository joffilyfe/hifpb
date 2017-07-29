class TeacherPolicy < ApplicationPolicy

  def index?
    user.permissions.where(:module => "teacher", :action => "index").any? or user.admin?
  end

  def import?
    user.permissions.where(:module => "teacher", :action => "import").any? or user.admin?
  end
end
