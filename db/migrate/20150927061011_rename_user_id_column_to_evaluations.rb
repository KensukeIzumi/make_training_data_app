class RenameUserIdColumnToEvaluations < ActiveRecord::Migration
  def change
    rename_column :evaluations, :user_id,:evaluated_user_id
  end
end
