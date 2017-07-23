class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :title
      t.string :module
      t.string :action

      t.timestamps
    end

    create_join_table :permissions, :users do |t|
      t.index [:permission_id, :user_id]
    end
  end
end
