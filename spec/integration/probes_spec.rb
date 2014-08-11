require "rails_helper"

resource "Probes" do
  header "Content-type", "application/json"

  get "/probes" do
    let!(:probe) { create :probe }
    let!(:run)   { probe.runs.create attributes_for :run }
    let!(:site)  { create :site  }
    let!(:ping)  { run.pings.create attributes_for :ping, site_id: site.id  }

    let!(:ping_1)    { {response_ms: ping.response_ms, url: site.url} }
    let!(:probe_1) { {name: probe.name, location: probe.location, ip: probe.ip, pings: [ping_1] } }
    let!(:expected)  { [probe_1] }

    example_request "Get the latest pings for each probe" do
      expect(status).to eq 200
      expect(response_body).to eq JSON.generate(expected)
    end
  end

  put "/probes/ProbeName" do

    parameter :location, "The location of the probe",   required: true, scope: :probe
    parameter :ip,       "The IP address of the probe", required: true, scope: :probe

    let(:ip) { Faker::Internet.ip_v4_address }
    let(:location) { Faker::Address.city }

    let(:raw_post) { params.to_json }

    example_request "Create or update a probe" do
      expect(status).to eq 201

      expect(Probe.first.name).to eq "ProbeName"
      expect(Probe.first.ip).to eq ip
      expect(Probe.first.location).to eq location
    end
  end

  post "/probes/ProbeName/runs" do
    let(:ping_times) {[40, 200]}

    parameter :pings, "The sites that have been pinged and the response time", required: true

    let(:pings) {
      [
        { site_name: "site 1", response_ms: 200 },
        { site_name: "site 2", response_ms:  40 }
      ]
    }

    let!(:site_1) { create :site, url: "site 1" }
    let!(:site_2) { create :site, url: "site 2" }

    before do
      create :probe, name: "ProbeName"
    end

    let(:raw_post) { params.to_json }

    example_request "Posting ping times" do
      expect(status).to eq 201

      expect(Ping.all.map(&:response_ms)).to match_array ping_times
    end
  end
end
