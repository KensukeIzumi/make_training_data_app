class AddImageToPreparedImages < ActiveRecord::Migration
  def change
    add_column :prepared_images, :image, :string
  end
end
