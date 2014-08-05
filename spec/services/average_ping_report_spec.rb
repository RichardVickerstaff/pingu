require 'rails_helper'

describe AveragePingReport do
  describe '.generate' do

    before do
      # TODO: Use helper methods for probe/site creation when they exist!
      probe = create(:probe)
      run_1 = probe.runs.create attributes_for(:run)
      run_2 = probe.runs.create attributes_for(:run)

      ping_1 = run_1.pings.create attributes_for(:ping)
      ping_2 = run_2.pings.create attributes_for(:ping)

      uk = create(:site_group, :uk)
      us = create(:site_group, :us)

      uk_site = uk.sites.create attributes_for(:site)
      us_site = us.sites.create attributes_for(:site)

      ping_1.site = uk_site
      ping_2.site = us_site
    end

    it 'returns the average ping from the last 5 minutes per site group' do
      expected = [
        AveragePingReport::AveragePing.new(group_name: 'UK', average_ping: 20),
        AveragePingReport::AveragePing.new(group_name: 'US', average_ping: 40)
      ]
      expect(described_class.generate).to eq expected
    end

  end

end
