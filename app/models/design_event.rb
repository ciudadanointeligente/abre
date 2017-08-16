class DesignEvent < ActiveRecord::Base

  belongs_to :project

  has_many :pictures, :dependent => :destroy

end
