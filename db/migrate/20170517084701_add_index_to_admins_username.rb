class AddIndexToAdminsUsername < ActiveRecord::Migration[5.0]
  def change
    add_index :admins, :username, unique: true
  end
end
