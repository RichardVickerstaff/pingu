class Ping < ActiveRecord::Base
  validates :response_ms, presence: true
  belongs_to :site
  belongs_to :run

  delegate :site_group, to: :site, prefix: false
  delegate :url, to: :site

  def responded?
    (response_ms == -1) ? false : true
  end
end
