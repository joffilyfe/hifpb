class RemoveStartDateFromSemesters < ActiveRecord::Migration[5.1]
  def change
    remove_column :semesters, :start_date, :date
  end
end
