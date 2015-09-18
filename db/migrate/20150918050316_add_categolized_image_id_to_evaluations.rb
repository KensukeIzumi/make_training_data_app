class AddCategolizedImageIdToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :categolized_image_id, :integer
  end
end
