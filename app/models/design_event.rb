class DesignEvent < ActiveRecord::Base

  belongs_to :project

  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true

end
