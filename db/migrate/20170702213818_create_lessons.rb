class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :day
      t.references :laboratory, foreign_key: true
      t.references :schoolroom, foreign_key: true
      t.references :classroom, foreign_key: true
      t.references :campus_schedule, foreign_key: true

      t.timestamps
    end
  end
end
