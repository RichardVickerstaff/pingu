class SiteGroup < ActiveRecord::Base
  validates :name, presence: true
  has_many :sites
end
