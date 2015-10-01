class DropTableReportedImages < ActiveRecord::Migration
  def change
    drop_table :reported_images
  end
end
