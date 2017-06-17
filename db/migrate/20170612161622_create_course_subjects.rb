class CreateCourseSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :course_subjects do |t|
      t.string :initials
      t.string :description
      t.integer :kind
      t.integer :count_rating
      t.string :description_history
      t.boolean :optinonal
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
