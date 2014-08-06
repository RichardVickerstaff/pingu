require "rails_helper"

describe V1::SiteGroupsController, type: :controller do
  let(:us) { FactoryGirl.build(:site_group, :us) }
  let(:uk) { FactoryGirl.build(:site_group, :uk) }

  describe "GET samples" do
    let(:site_groups) { double :site_groups }

    before { allow(SiteGroup).to receive(:all).and_return site_groups }

    it "assigns @report" do
      get :samples
      expect(assigns[:site_groups]).to eq site_groups
    end
  end

  describe "GET report" do
    let(:report) { double :report }

    before { allow(AveragePingReport).to receive(:generate).and_return report }

    it "assigns @report" do
      get :report
      expect(assigns[:report]).to eq report
    end
  end

end
