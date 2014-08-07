require "rails_helper"

describe V1::SitesController, type: :controller do

  describe "GET sample" do
    let(:site_groups) { double :site_groups }

    before { allow(SiteGroupSample).to receive(:generate).and_return site_groups }

    it "assigns @sample_sites" do
      get :sample
      expect(assigns[:sample_sites]).to eq site_groups
    end

  end
end
