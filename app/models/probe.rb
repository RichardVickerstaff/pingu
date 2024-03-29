class Probe < ActiveRecord::Base
  validates :uid,      presence: true,  uniqueness: { case_sensitive: false }
  validates :location, presence: true
  validates :ip,       presence: true
  has_many :runs

  scope :alive, -> { joins(:runs).merge Run.recent }

  def latest_pings
    runs.last.pings.to_a
  end
end
