require "rails_helper"

describe V1::RunsController, type: :controller do
  describe "POST report" do
    let(:run_builder) { double :run_builder }

    context 'the probe reporting has been created' do
      let(:probe) { create :probe }
      let(:post_data) {
        [{"site_name"=>"site 3", "response_ms"=>"-1"},
         {"site_name"=>"site 4", "response_ms"=>"40"}]
      }

      before do
        allow(RunBuilder).to receive(:new).with(probe, post_data).and_return run_builder
        allow(run_builder).to receive(:build)
      end

      it "calls the run generator with the run data" do
        expect(run_builder).to receive(:build)
        post :create, probe_id: probe.name, pings: post_data
      end

      it "returns a 201 status" do
        post :create, probe_id: probe.name, pings: post_data
        expect(response.status).to eq 201
      end
    end

    context 'the probe reporting has not been created' do
      let(:no_probe_created) { build :probe }

      it "returns an error" do
        post :create, probe_id: no_probe_created.name
        expect(response.status).to eq 404
      end

      it "does not call the run generator" do
        post :create, probe_id: no_probe_created.name
        expect(run_builder).to_not receive(:build)
      end
    end
  end

end
