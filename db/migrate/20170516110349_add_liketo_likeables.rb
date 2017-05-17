class AddLiketoLikeables < ActiveRecord::Migration[5.0]
  def change
    add_column :likeables, :like, :boolean
  end
end
