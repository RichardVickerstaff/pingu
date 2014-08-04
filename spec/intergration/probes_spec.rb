require 'rails_helper'

resource 'Probes' do

  pending post '/probes/:name/run' do
    example "Posting ping times" do
      post_json = {
        probe_name: 'Probe 1',
        pings: [
          {
            group_name: 'Location A',
            pings: [
              {site_name: 'site 1', response_time: 200},
              {site_name: 'site 2', response_time:  -1},
              {site_name: 'site 3', response_time: 100}
            ]
          },{
            group_name: 'Location B',
            ping: [
              {site_name: 'site 4', response_time:  40},
            ]
          }
        ]
      }
      do_request post_json
      expect(status).to eq 201
    end

  end
end
