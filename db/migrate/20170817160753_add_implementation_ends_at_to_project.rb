class AddImplementationEndsAtToProject < ActiveRecord::Migration
  def change
    add_column :projects, :implementation_ends_at, :date
  end
end
