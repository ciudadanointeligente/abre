class Report < ActiveRecord::Base

  belongs_to :project

  has_many :pictures, :dependent => :destroy
  has_many :comments, as: :commentable

  accepts_nested_attributes_for :pictures, :allow_destroy => true

end
