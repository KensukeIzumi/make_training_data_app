class CreateReportedImages < ActiveRecord::Migration
  def change
    create_table :reported_images do |t|
      t.integer :prepared_iamge_id
      t.integer :report_count

      t.timestamps null: false
    end
  end
end
