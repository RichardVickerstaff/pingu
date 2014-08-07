require "rails_helper"

describe Ping do
  it { is_expected.to validate_presence_of :response_ms }
  it { is_expected.to belong_to :site }
  it { is_expected.to belong_to :run  }
  it { is_expected.to delegate_method(:site_group).as(:site_group).to(:site) }
  it { is_expected.to delegate_method(:url).as(:url).to(:site) }

  describe "#responded?" do
    let(:responded)  { create :ping }
    let(:didnt_respond)  { create :ping, response_ms: -1 }
    it "returns true if the ping responded" do
      expect(responded.responded?).to be true
    end

    it "returns false if the ping did not respond" do
      expect(didnt_respond.responded?).to be false
    end
  end
end
