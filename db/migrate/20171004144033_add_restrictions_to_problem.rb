class AddRestrictionsToProblem < ActiveRecord::Migration
  def change
    change_table :restrictions do |t|
      t.references :problem
    end
  end
end
