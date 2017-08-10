class AddProposalsToProject < ActiveRecord::Migration
  def change
    change_table :proposals do |t|
      t.references :project
    end
  end
end
