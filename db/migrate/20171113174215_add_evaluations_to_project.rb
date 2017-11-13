class AddEvaluationsToProject < ActiveRecord::Migration
  def change
    add_reference :evaluations, :project, index: true, foreign_key: true
  end
end
