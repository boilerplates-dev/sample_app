class RemoveAttachedImageFromMicropost < ActiveRecord::Migration[5.2]
  def change
    remove_column :microposts, :image
  end
end
