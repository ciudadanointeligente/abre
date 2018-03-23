class AddProjectIdToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :project_id, :integer
  end
end
