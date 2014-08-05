require 'rails_helper'

describe Probe do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :ip }
  it { is_expected.to validate_presence_of :location }
  it { is_expected.to have_many :runs }

  describe '.alive_probes' do
    let(:alive_probe) { create :probe }
    let(:dead_probe)  { create :probe }

    before do
      alive_probe.runs.create  attributes_for(:run)
      dead_probe.runs.create   attributes_for(:run, created_at: 5.minutes.ago)
    end

    it 'returns the probes that have reported in the last 5 minutes' do
      expect(described_class.alive).to eq [alive_probe]
    end
  end

  describe '.latest_pings' do
    let(:probe) { create :probe }

    before do
      run_1 = probe.runs.create  attributes_for(:run)
      run_1.pings.create(attributes_for(:ping))

      run_2 = probe.runs.create  attributes_for(:run)
      @ping_2 = run_2.pings.create attributes_for(:ping)
    end

    it 'returns the pings for the last run' do
      expect(probe.latest_pings).to eq [@ping_2]
    end
  end

end
