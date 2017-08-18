class AddImplementationStartsAtToProject < ActiveRecord::Migration
  def change
    add_column :projects, :implementation_starts_at, :date
  end
end
