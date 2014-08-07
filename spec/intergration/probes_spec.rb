require "rails_helper"

resource "Probes" do
  header "Content-type", "application/json"

  post "/probes/Probe1/runs" do
    let(:pings) {[40, 200]}

    parameter :site_groups, "The site groups that have been pinged", required: true

    let(:site_groups) {
       [
        {
          group_name: "Location A",
          pings:      [
            { site_name: "site 1", response_ms: 200 },
          ]
        }, {
          group_name: "Location B",
          pings:       [
            { site_name: "site 2", response_ms:  40 }
          ]
        }
      ]
    }

    let!(:site_1) { create :site, url: "site 1" }
    let!(:site_2) { create :site, url: "site 2" }

    before do
      create :probe, name: "Probe1"
    end

    let(:raw_post) { params.to_json }

    example_request "Posting ping times" do
      expect(status).to eq 201

      expect(Ping.all.map(&:response_ms)).to match_array pings
    end
  end

end
