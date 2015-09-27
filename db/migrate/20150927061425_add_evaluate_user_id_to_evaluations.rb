class AddEvaluateUserIdToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :evaluate_user_id, :integer
  end
end
