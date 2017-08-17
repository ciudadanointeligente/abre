class AddAttachmentDocumentToDesignEvents < ActiveRecord::Migration
  def self.up
    change_table :design_events do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :design_events, :document
  end
end
