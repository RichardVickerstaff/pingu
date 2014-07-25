class Site < ActiveRecord::Base
  validates :url, presence: true
  belongs_to :site_group
end
