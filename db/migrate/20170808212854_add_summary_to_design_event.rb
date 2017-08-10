class AddSummaryToDesignEvent < ActiveRecord::Migration
  def change
    add_column :design_events, :summary, :text
  end
end
