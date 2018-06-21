class AddChallengeGroupToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :challenge_group, :boolean
  end
end
