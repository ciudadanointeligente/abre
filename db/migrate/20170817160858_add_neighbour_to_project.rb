class AddNeighbourToProject < ActiveRecord::Migration
  def change
    add_column :projects, :responsible_neighbour_name, :string
    add_column :projects, :responsible_neighbour_mail, :string
    add_column :projects, :responsible_neighbour_phone, :string
  end
end
