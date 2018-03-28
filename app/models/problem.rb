class Problem < ActiveRecord::Base
  include Filterable

  validates :title, presence: true
  validates :description, presence: true
  validates :summary, presence: true
  validates :call_to_action, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  has_and_belongs_to_many :geozones
  belongs_to :user
  has_many :proposals
  has_many :restrictions
  belongs_to :project

  paginates_per 12

  scope :expired,  -> { where('ends_at < ?', Time.current) }
  scope :active,  -> { where('ends_at > ?', Time.current) }

  scope :proposal,  -> { where('status = ?', 'Propuestas') }
  scope :implementation, -> { where('status = ?', 'Implementación') }
  scope :evaluation,  -> { where('status = ?', 'Evaluación') }
  scope :design, -> { where('status = ?', 'Diseño') }

  # before_save :define_status

  accepts_nested_attributes_for :restrictions
  accepts_nested_attributes_for :project

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

  def define_status
    if Date.today <= self.ends_at
      self.status = 'Propuestas'
    elsif self.project.design_events.any?
      self.project.design_events.each do |de|
        if de.starts_at >= Date.today
          self.status = 'Diseño'
        end
      end
    elsif Date.today >= self.implementation_ends_at
      self.status = 'Evaluación'
    else
      self.status = 'Implementación'
    end
  end

  # def status
  #   if Date.today <= self.ends_at
  #     return 'Propuestas'
  #   elsif self.project.design_events.any?
  #     self.project.design_events.each do |de|
  #       if de.starts_at >= Date.today
  #         return 'Diseño'
  #       end
  #     end
  #   elsif Date.today >= self.implementation_ends_at
  #     return 'Evaluación'
  #   else
  #     return 'Implementación'
  #   end
  # end

  def self.valid
    self.where('"starts_at" < ? AND "ends_at" > ?', Date.today, Date.today)
  end

  def valid
    self.starts_at <= Date.today && self.ends_at > Date.today
  end

  def self.pop
    self.first
  end

  def self.clip
    self.where('"id" != ?', self.pop.id)
  end
end
