class CreateSemesters < ActiveRecord::Migration[5.1]
  def change
    create_table :semesters do |t|
      t.string :year
      t.string :semester
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
