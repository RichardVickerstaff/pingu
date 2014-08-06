require "rails_helper"

describe SiteGroupSample do
  describe ".generate" do
    let(:us_site) { us.sites.create attributes_for(:site) }
    let(:uk_site_2) { uk.sites.create attributes_for(:site) }
    let(:uk_site_1) { uk.sites.create attributes_for(:site) }
    let(:us) { create(:site_group, :us) }
    let(:uk) { create(:site_group, :uk) }

    it "returns the average ping from the last 5 minutes per site group" do
      expected = [
        SiteGroupSample::Sample.new("UK", [uk_site_1, uk_site_2]),
        SiteGroupSample::Sample.new("USA", [us_site])
      ]
      expect(described_class.generate).to eq expected
    end

  end

end

