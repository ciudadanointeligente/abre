class Picture < ActiveRecord::Base

  belongs_to :design_event

  has_attached_file :image,
                    url: "/public/images/:id/:styles/:basename.:extension"

  validates_attachment :image,
                       content_type: { content_type: ["image/jpeg", "image/png"] },
                       size: { in: 0..500.kilobytes }
end
