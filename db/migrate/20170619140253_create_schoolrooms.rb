class CreateSchoolrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :schoolrooms do |t|
      t.integer :maximum_capacity
      t.integer :amount_resources
      t.boolean :status
      t.string :name
      t.string :initials

      t.timestamps
    end
  end
end
