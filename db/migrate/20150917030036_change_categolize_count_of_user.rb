class ChangeCategolizeCountOfUser < ActiveRecord::Migration
  def self.up
    change_column :users, :categolize_count, :integer, :default => 0
  end

  def self.down
    change_column :users, :categolize_count, :string, :defaultt => NULL
  end
end
