class RemoveReportedCountToPreparedImages < ActiveRecord::Migration
  def change
    remove_column :prepared_images, :reported_count, :string
  end
end
