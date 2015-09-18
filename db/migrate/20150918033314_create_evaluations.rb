class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :user_id
      t.string :categolized_image_integer

      t.timestamps null: false
    end
  end
end
