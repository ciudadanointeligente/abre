class DesignEvent < ActiveRecord::Base

  belongs_to :project
  has_many :pictures, :dependent => :destroy

  accepts_nested_attributes_for :pictures, :allow_destroy => true

  has_attached_file :document
  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

end
