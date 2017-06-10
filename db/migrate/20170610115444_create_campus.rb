class CreateCampus < ActiveRecord::Migration[5.1]
  def change
    create_table :campus do |t|
      t.string :description
      t.string :sigla

      t.timestamps
    end
  end
end
