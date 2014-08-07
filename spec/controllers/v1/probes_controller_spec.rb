require "rails_helper"

describe V1::ProbesController, type: :controller do
  describe "GET index" do
    let(:probe_report) { double :probe_report }

    before { allow(ProbeReport).to receive(:generate).and_return probe_report }

    it "assigns @report" do
      get :index
      expect(assigns[:probe_report]).to eq probe_report
    end
  end

end
