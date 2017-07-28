class CreateCoursesUsers < ActiveRecord::Migration[5.1]
  def change
  	create_join_table :courses, :users do |t|
      t.index [:course_id, :user_id]
    end
  end
end
