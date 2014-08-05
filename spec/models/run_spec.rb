require 'rails_helper'

describe Run do
  it { is_expected.to belong_to :probe }
  it { is_expected.to have_many :pings }

  describe '.recent' do
    let!(:recent_run) { create(:run) }
    let!(:old_run) { create(:run, created_at: 6.minutes.ago) }

    it 'returns runs younger than 5 minutes old' do
      expect(described_class.recent).to eq [recent_run]
    end
  end
end
