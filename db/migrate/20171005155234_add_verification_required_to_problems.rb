class AddVerificationRequiredToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :verification_required, :boolean
  end
end
