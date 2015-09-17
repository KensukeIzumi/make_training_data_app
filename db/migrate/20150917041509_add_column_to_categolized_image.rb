class AddColumnToCategolizedImage < ActiveRecord::Migration
  def change
    add_column :categolized_images, :evaluation, :integer, default: 0
  end
end
