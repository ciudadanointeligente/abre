class AddFormToProject < ActiveRecord::Migration
  def change
    add_column :projects, :form, :boolean
  end
end
