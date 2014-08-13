require "rails_helper"

describe ProbeReport do
  describe ".generate" do
    let(:site_1)  { create :site }
    let(:site_2)  { create :site }

    let(:probe_1) { create :probe }
    let(:run_1)   { probe_1.runs.create attributes_for :run }
    let(:ping_1)  { run_1.pings.create attributes_for(:ping, site_id: site_1.id ) }
    let(:probe_2) { create :probe }
    let(:run_2)   { probe_2.runs.create attributes_for :run }
    let(:ping_2)  { run_2.pings.create attributes_for(:ping, site_id: site_2.id ) }

    it "returns the average ping from the last 5 minutes per site group" do
      expected = [
        ProbeReport::LatestPingReport.new(probe_1.uid, probe_1.location, probe_1.ip, [{response_ms: ping_1.response_ms, url: site_1.url}]),
        ProbeReport::LatestPingReport.new(probe_2.uid, probe_2.location, probe_2.ip, [{response_ms: ping_2.response_ms, url: site_2.url}]),
      ]
      expect(described_class.generate).to eq expected
    end

  end

end

