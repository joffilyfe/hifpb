class CreateCampusSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :campus_schedules do |t|
      t.integer :shift
      t.time :start
      t.time :end
      t.references :campus, foreign_key: true
      t.timestamps
    end

    add_index :campus_schedules, [:campus_id, :start, :end], :unique => true
  end
end
