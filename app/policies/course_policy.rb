class CoursePolicy < ApplicationPolicy
  
  def show?
    user.permissions.where(:module => "course", :action => "show").any? or user.admin?
  end

  def import?
    user.permissions.where(:module => "course", :action => "import").any? or user.admin?
  end
end