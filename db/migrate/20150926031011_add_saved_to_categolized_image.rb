class AddSavedToCategolizedImage < ActiveRecord::Migration
  def change
    add_column :categolized_images, :saved, :integer,default: 0
  end
end
