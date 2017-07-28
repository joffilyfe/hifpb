class RemoveSemesterFromClassrooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :classrooms, :semester, :integer
  end
end
