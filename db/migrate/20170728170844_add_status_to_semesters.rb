class AddStatusToSemesters < ActiveRecord::Migration[5.1]
  def change
    add_column :semesters, :status, :boolean
  end
end
