class AddImagesToDesignEvents < ActiveRecord::Migration
  def change
    add_attachment :design_events, :image
  end
end
