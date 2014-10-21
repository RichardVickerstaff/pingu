require "rails_helper"

describe V1::SiteGroupsController, type: :controller do
  let(:us) { FactoryGirl.build(:site_group, :us) }
  let(:uk) { FactoryGirl.build(:site_group, :uk) }

  describe "GET report" do
    let(:report) { double :report }

    before { allow(AveragePingReport).to receive_message_chain("new.generate").and_return report }

    it "assigns @report" do
      get :report
      expect(assigns[:report]).to eq report
    end
  end

end
