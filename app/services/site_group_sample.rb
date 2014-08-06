class SiteGroupSample
  Sites = Struct.new(:group_name, :sample_urls)

  def self.generate
    sites = SiteGroup.all
    sites.map { |site| Sites.new(site.name, site.sample_sites) }
  end
end
