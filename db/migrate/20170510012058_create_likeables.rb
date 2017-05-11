class CreateLikeables < ActiveRecord::Migration[5.0]
  def change
    create_table :likeables do |t|
      t.integer :liker_id
      t.integer :liked_id

      t.timestamps
    end
    add_index :likeables, :liker_id
    add_index :likeables, :liked_id
    add_index :likeables, [:liker_id, :liked_id], unique: true
  end
end
