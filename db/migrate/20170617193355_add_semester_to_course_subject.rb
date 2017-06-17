class AddSemesterToCourseSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :course_subjects, :semester, :integer
  end
end
