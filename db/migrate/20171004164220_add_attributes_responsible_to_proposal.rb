class AddAttributesResponsibleToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :responsible_phone, :string
    add_column :proposals, :responsible_id, :string
  end
end
