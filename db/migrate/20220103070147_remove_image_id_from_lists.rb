class RemoveImageIdFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :image_id, :string
  end
end
