class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers, id: false do |t|
      t.primary_key :registration
      t.string :name
      t.string :campus
      t.string :department
      t.string :mail

      t.timestamps
    end
  end
end
