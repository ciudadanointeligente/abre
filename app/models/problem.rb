class Problem < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :summary, presence: true
  validates :call_to_action, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  has_and_belongs_to_many :geozones
  belongs_to :user
  has_many :proposals

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

end
