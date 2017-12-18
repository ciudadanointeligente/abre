class Project < ActiveRecord::Base

  has_and_belongs_to_many :geozones
  has_many :design_events
  has_many :proposals
  has_many :reports
  has_many :evaluations
  belongs_to :problem

  accepts_nested_attributes_for :design_events, :allow_destroy => true
  accepts_nested_attributes_for :reports, :allow_destroy => true
  accepts_nested_attributes_for :proposals

  def geozones_name
    if self.geozones.any?
      names = ''
      init = true
      self.geozones.each do |g|
        if !init
          names += ', '
        end
        names += g.name
        init = false
      end
      return names
    else
      return 'Toda la comuna'
    end
  end

  def status
    if self.form
      return 'Evaluación'
    elsif !self.implementation_starts_at.nil? && self.implementation_starts_at < Date.today
      return 'Implementación'
    elsif self.design_events.count > 0
      return 'Diseño'
    else
      return 'Propuestas'
    end
  end


  def next_date_design_event
    if self.design_events.any?
      @design_events = self.design_events.order('starts_at DESC')
      next_date = @design_events[0].starts_at
    end
  end

end
