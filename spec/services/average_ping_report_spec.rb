require 'rails_helper'

describe AveragePingReport do
  describe '.generate' do
    let(:us) { create(:site_group, :us) }
    let(:uk) { create(:site_group, :uk) }
    let(:ping_2) { run.pings.create attributes_for(:ping) }
    let(:ping_1) { run.pings.create attributes_for(:ping) }
    let(:run) { probe.runs.create attributes_for(:run) }
    let(:probe) { create(:probe) }

    before do
      # TODO: Use helper methods for probe/site creation when they exist!
      uk_site = uk.sites.create attributes_for(:site)
      us_site = us.sites.create attributes_for(:site)

      ping_1.site = uk_site
      ping_2.site = us_site
      ping_1.save
      ping_2.save
    end

    it 'returns the average ping from the last 5 minutes per site group' do
      expected = [
        AveragePingReport::AveragePing.new('UK', ping_1.response_ms),
        AveragePingReport::AveragePing.new('USA', ping_2.response_ms)
      ]
      expect(described_class.generate).to eq expected
    end

  end

end
