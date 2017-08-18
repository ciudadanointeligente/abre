class AddDesignEventToPictures < ActiveRecord::Migration
  def change
    add_reference :pictures, :design_event, index: true, foreign_key: true
  end
end
