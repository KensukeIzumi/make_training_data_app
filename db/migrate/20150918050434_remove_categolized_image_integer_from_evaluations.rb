class RemoveCategolizedImageIntegerFromEvaluations < ActiveRecord::Migration
  def change
    remove_column :evaluations, :categolized_image_integer, :string
  end
end
