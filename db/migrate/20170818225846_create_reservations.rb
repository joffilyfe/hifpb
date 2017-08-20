class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :date_reservation
      t.boolean :status
      t.references :laboratory, foreign_key: true
      t.references :schoolroom, foreign_key: true
      t.references :campus_schedule, foreign_key: true
      t.timestamps
    end
  end
end
