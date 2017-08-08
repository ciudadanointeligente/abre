class AddDescriptionToDesignEvent < ActiveRecord::Migration
  def change
    add_column :design_events, :description, :text
  end
end
