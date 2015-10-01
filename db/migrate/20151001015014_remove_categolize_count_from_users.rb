class RemoveCategolizeCountFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :categolize_count, :int
  end
end
