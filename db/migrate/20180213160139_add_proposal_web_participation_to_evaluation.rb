class AddProposalWebParticipationToEvaluation < ActiveRecord::Migration
  def change
    add_column :evaluations, :proposal_web_participation, :boolean
    add_column :evaluations, :design_participation_2, :boolean
    add_column :evaluations, :implementation_participation_2, :boolean
    add_column :evaluations, :design_evaluation_2, :integer
    add_column :evaluations, :implementation_evaluation_2, :integer
    add_column :evaluations, :proposal_web, :text
    add_column :evaluations, :design_2, :text
    add_column :evaluations, :implementation_2, :text
  end
end
