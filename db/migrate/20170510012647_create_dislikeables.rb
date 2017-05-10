class CreateDislikeables < ActiveRecord::Migration[5.0]
  def change
    create_table :dislikeables do |t|
      t.integer :disliker_id
      t.integer :disliked_id

      t.timestamps
    end
    add_index :dislikeables, :disliker_id
    add_index :dislikeables, :disliked_id
    add_index :dislikeables, [:disliker_id, :disliked_id], unique: true
  end
end
