require "rails_helper"

describe RunBuilder do
  let(:probe) { create :probe }
  let(:run) { [
    {"site_name"=>"site 1", "response_ms"=>"-1"},
    {"site_name"=>"site 2", "response_ms"=>"40"}
  ] }

  subject { RunBuilder.new probe, run }

  describe "#build" do
    let!(:site_1) { create :site, url: "site 1" }
    let!(:site_2) { create :site, url: "site 2" }

    it 'creates a run for the probe' do
      subject.build
      expect(probe.runs.count).to eq 1
    end

    it 'creates pings for the run' do
      subject.build
      run = probe.runs.first
      expect(run.pings.map(&:response_ms)).to match_array [-1, 40]
    end

    it 'sets the site for each ping' do
      subject.build
      run = probe.runs.first
      first_ping = run.pings.first
      second_ping = run.pings.last
      expect(first_ping.site).to eq site_1
      expect(second_ping.site).to eq site_2
    end
  end
end
