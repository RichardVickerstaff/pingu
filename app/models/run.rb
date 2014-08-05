class Run < ActiveRecord::Base
  belongs_to :probe
  has_many :pings

  scope :recent, -> { where("created_at > ?", 5.minutes.ago) }
end
