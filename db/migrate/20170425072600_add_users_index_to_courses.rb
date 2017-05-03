class AddUsersIndexToCourses < ActiveRecord::Migration[5.0]
  def change
    add_index :courses, [:user_id, :created_at]
  end
end
