class ChangeEvaluationOfUser < ActiveRecord::Migration
  def self.up
    change_column :users, :evaluation, :integer, :default => 0
  end

  def self.down
    change_column :users, :evaluation, :integer, :defaultt => NULL
  end
end
