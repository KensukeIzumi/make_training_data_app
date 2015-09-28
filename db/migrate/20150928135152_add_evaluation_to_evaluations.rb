class AddEvaluationToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :evaluation, :integer
  end
end
