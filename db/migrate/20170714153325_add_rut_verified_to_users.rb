class AddRutVerifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rut_verified, :boolean
  end
end
