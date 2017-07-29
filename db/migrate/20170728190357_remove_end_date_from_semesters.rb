class RemoveEndDateFromSemesters < ActiveRecord::Migration[5.1]
  def change
    remove_column :semesters, :end_date, :date
  end
end
