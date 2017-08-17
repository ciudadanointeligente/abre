class Picture < ActiveRecord::Base

  belongs_to :design_event

  has_attached_file :image

  do_not_validate_attachment_file_type :image

end
