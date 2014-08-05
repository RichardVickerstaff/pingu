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
end
