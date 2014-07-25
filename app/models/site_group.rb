class SiteGroup < ActiveRecord::Base
  validates :name, presence: true
  has_many :sites

  def sample_sites
    sites.all.sample(3).map(&:url)
  end
end
