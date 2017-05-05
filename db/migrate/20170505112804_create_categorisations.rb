class CreateCategorisations < ActiveRecord::Migration[5.0]
  def change
    create_table :categorisations do |t|
      t.references :course, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :categorisations, [:course_id, :category_id], unique: true
  end
end
