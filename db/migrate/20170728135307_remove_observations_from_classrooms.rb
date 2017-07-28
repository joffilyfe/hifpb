class RemoveObservationsFromClassrooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :classrooms, :observations, :text
  end
end
