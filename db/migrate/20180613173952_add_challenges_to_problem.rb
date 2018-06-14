class AddChallengesToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :challenge_all, :boolean
    add_column :problems, :challenge_proposal, :boolean
    add_column :problems, :challenge_design, :boolean
    add_column :problems, :challenge_poll, :boolean
  end
end
