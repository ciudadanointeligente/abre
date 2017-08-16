class AddResponsibleOfficialNameToProject < ActiveRecord::Migration
  def change
    add_column :projects, :responsible_official_name, :string
  end
end
