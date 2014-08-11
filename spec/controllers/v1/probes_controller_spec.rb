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

  describe 'PUT update' do
    let(:ip) { Faker::Internet.ip_v4_address }
    let(:location) { Faker::Address.city }
    let(:name) { "A name" }

    context "The probe does not exist" do
      it "Creates a new probe" do
        put :update, id: name, probe: { location: location, ip: ip}

        expect(Probe.first.name).to eq name
        expect(Probe.first.ip).to eq ip
        expect(Probe.first.location).to eq location

        expect(response.status).to eq 201
      end
    end

    context "The probe does exist" do

      before do
        create :probe, name: name, ip: "This must change"
      end

      it "Updates the probe" do
        put :update, id: name, probe: {location: location, ip: ip}

        expect(Probe.all.count).to eq 1
        expect(Probe.first.ip).to eq ip
        expect(Probe.first.location).to eq location
        expect(response.status).to eq 201
      end
    end
  end
end
