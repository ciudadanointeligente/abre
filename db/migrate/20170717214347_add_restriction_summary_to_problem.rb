class AddRestrictionSummaryToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :restriction_summary, :string
  end
end
