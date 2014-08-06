require "rails_helper"

describe SiteGroup do
  subject { described_class.create(name: "Test") }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to have_many :sites }

  describe "#sample_sites" do
    context "when there are no sites" do
      it "returns an empty array" do
        expect(subject.sample_sites).to eq []
      end
    end

    context "when there are sites" do
      let(:bbc) { FactoryGirl.create(:bbc) }

      before { subject.sites << bbc }

      it "returns an array of sites" do
        expect(subject.sample_sites).to eq [bbc.url]
      end
    end

    context "when there are more than 3 sites" do
      let(:all_sites) { FactoryGirl.create_list(:site, 5) }

      before { subject.sites << all_sites }

      it "returns an array of 3 sites from the pool" do
        selected_sites = subject.sample_sites & all_sites.map(&:url)
        expect(selected_sites.size).to eq 3
      end

      it "returns a random sample" do
        sample_a = subject.sample_sites
        sample_b = 10.times do
          sample = subject.sample_sites
          break if sample_a != sample
        end
        expect(sample_a).to_not eq(sample_b)
      end
    end
  end

end
