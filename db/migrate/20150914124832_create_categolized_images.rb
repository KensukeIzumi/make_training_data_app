class CreateCategolizedImages < ActiveRecord::Migration
  def change
    create_table :categolized_images do |t|
      t.integer :start_x
      t.integer :start_y
      t.integer :end_x
      t.integer :end_y
      t.string :name
      t.integer :user_id
      t.integer :prepared_image_id
      t.references :prepared_image, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
