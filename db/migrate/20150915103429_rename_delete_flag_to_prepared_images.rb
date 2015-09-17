class RenameDeleteFlagToPreparedImage < ActiveRecord::Migration
 
   def up 
    rename_column :prepared_images, :delete_flag, :reported_count
   end

   def down
     rename_column :prepared_images, :reported_count, :delete_flag
   end
end
