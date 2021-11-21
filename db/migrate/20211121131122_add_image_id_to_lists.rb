class AddImageIdToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :image_id, :string
  end
end
