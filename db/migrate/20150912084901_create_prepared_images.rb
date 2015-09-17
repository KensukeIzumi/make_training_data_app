class CreatePreparedImages < ActiveRecord::Migration
  def change
    create_table :prepared_images do |t|
      t.string :image_resource
      t.integer :view_count
      t.integer :delete_flag

      t.timestamps null: false
    end
  end
end
