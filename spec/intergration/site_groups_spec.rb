require "rails_helper"

resource "Site Group" do

  get "/site_groups/report" do
    let(:probes)         { create_list :probe, 2 }
    let(:normal_ping_2)  { create :ping, response_ms: 50 }
    let(:normal_ping_1)  { create :ping, response_ms: 50 }
    let(:failed_ping)    { create :ping, :failed }
    let(:long_ping)      { create :ping, response_ms: 200 }
    let(:site_group_a)   { create :site_group, name: "Location A" }
    let(:site_group_b)   { create :site_group, name: "Location B" }
    let(:run_2) { probes.last.runs.create attributes_for(:run) }
    let(:run_1) { probes.first.runs.create attributes_for(:run) }

    before do
      # TODO: create using run.create(attributes_for :ping)
      site_1 = site_group_a.sites.create attributes_for(:site)
      site_2 = site_group_b.sites.create attributes_for(:site)
      site_3 = site_group_b.sites.create attributes_for(:site)
      site_4 = site_group_b.sites.create attributes_for(:site)

      long_ping.site =   site_1
      normal_ping_1.site = site_2
      normal_ping_2.site = site_3
      failed_ping.site =  site_4

      run_1.pings << long_ping << normal_ping_1
      run_2.pings  << failed_ping << normal_ping_2
    end

    example "Getting ping times" do
      expected = [
        {
          group_name:          "Location A",
          average_response_ms: 200
        },
        {
          group_name:          "Location B",
          average_response_ms: 50
        }
      ]

      do_request

      expect(status).to eq 200
      expect(response_body).to eq JSON.generate(expected)
    end
  end

end
