class AddRutPhoneNameToVote < ActiveRecord::Migration
  def change
    add_column :votes, :rut, :string
    add_column :votes, :phone, :string
    add_column :votes, :name, :string
  end
end
