class SiteGroupSample
  def self.generate
    groups = SiteGroup.all
    groups.reduce([]) { |sample, group| sample + group.sample_sites }
  end
end
