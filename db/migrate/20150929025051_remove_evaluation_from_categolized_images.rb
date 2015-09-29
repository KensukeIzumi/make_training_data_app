class RemoveEvaluationFromCategolizedImages < ActiveRecord::Migration
  def change
    remove_column :categolized_images, :evaluation, :integer
  end
end
