require "rails_helper"

describe SiteGroupSample do
  describe ".generate" do
    let(:us) { create(:site_group, :us) }
    let(:uk) { create(:site_group, :uk) }
    let(:us_site) { us.sites.create attributes_for(:site) }
    let(:uk_site_2) { uk.sites.create attributes_for(:site) }
    let(:uk_site_1) { uk.sites.create attributes_for(:site) }

    it "returns a sample of URLs to ping" do
      expected = [ uk_site_1.url, uk_site_2.url, us_site.url ]
      expect(subject.generate).to match_array expected
    end

  end
end
