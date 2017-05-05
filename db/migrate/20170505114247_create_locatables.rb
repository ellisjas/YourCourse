class CreateLocatables < ActiveRecord::Migration[5.0]
  def change
    create_table :locatables do |t|
      t.references :location, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :locatables, [:course_id, :location_id], unique: true
  end
end
