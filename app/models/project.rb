class Project < ActiveRecord::Base

  has_and_belongs_to_many :geozones
  has_many :design_events
  has_many :proposals
  has_many :reports

  accepts_nested_attributes_for :design_events, :allow_destroy => true
  accepts_nested_attributes_for :reports, :allow_destroy => true

  accepts_nested_attributes_for :proposals

end
