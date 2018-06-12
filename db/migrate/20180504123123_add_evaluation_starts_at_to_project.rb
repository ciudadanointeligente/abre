class AddEvaluationStartsAtToProject < ActiveRecord::Migration
  def change
    add_column :projects, :evaluation_starts_at, :date
  end
end
