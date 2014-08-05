class Probe < ActiveRecord::Base
  validates :name,     presence: true
  validates :location, presence: true
  validates :ip,       presence: true
  has_many  :runs
  scope :alive, -> { joins(:runs).merge Run.recent }
end