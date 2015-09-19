class AddDeleteFlagToPreparedImages < ActiveRecord::Migration
  def change
    add_column :prepared_images, :delete_flag, :integer,default: 0
  end
end
