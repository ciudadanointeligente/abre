class AddReportsToProject < ActiveRecord::Migration
  def change
    add_reference :reports, :project, index: true, foreign_key: true
  end
end
