class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :code
      t.references :course, foreign_key: true
      t.references :course_subject, foreign_key: true
      t.references :teacher, references: :teacher
      t.integer :semester
      t.text :observations

      t.timestamps
    end
  end
end
