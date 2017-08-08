class AddResponsibleOfficialMailToProject < ActiveRecord::Migration
  def change
    add_column :projects, :responsible_official_mail, :string
  end
end
