class AddCombinationIndexToCategolizedImages < ActiveRecord::Migration
  def change
    add_index :categolized_images,[:name, :prepared_image_id],unique: true
  end
end
