class AddEvaluationEndssAtToProject < ActiveRecord::Migration
  def change
    add_column :projects, :evaluation_ends_at, :date
  end
end
