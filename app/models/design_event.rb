class DesignEvent < ActiveRecord::Base

  belongs_to :project

  has_attached_file :image, styles: { medium: '200x200>', thumb: '48x48>' }
  do_not_validate_attachment_file_type :image

end
