class AddPicturesToReport < ActiveRecord::Migration
  def change
    add_reference :pictures, :report, index: true, foreign_key: true
  end
end
