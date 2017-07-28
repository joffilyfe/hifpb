class AddSemesterRefToClassrooms < ActiveRecord::Migration[5.1]
  def change
    add_reference :classrooms, :semester, foreign_key: true
  end
end
