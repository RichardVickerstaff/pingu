require 'rails_helper'

resource "Site Group" do

  get '/site_groups/report' do

    let(:probes)      { FactoryGirl.create_list :probe, 2 }
    let(:runs)        { FactoryGirl.create_list :run, 2   }
    let(:normal_ping) { FactoryGirl.create :ping, response_ms: 50 }
    let(:failed_ping) { FactoryGirl.create :ping, :failed }
    let(:long_ping)   { FactoryGirl.create :ping, response_ms: 200}

    before do
      # TODO: create using run.create(attributes_for :ping)
      probes.first.runs << runs.first
      probes.last.runs  << runs.last
      runs.first.pings << long_ping << normal_ping
      runs.last.pings  << failed_ping << normal_ping
    end

    example 'Getting ping times' do
      expected =[
        {
          group_name: 'Location A',
          average_response_ms: 200,
          failed_pings: 0
        },
        {
          group_name: 'Location B',
          average_response_ms: 50,
          failed_pings: 1
        }
      ]

      do_request

      expect(status).to eq 200
      expect(response_body).to eq JSON.generate(expected)
    end
  end

  get '/site_groups/samples' do
    #TODO Do we care about these?
    response_field :group_name, 'The set of sites which these pages belong to'
    response_field :sample_urls, 'An array of selected urls'

    let!(:group){ FactoryGirl.create :site_group, :with_one_site }

    example 'Sample of sites to poll' do
      expected = [{ group_name: group.name, sample_urls: group.sites.map(&:url) }]

      do_request

      expect(status).to eq 200
      expect(response_body).to eq JSON.generate(expected)
    end

  end
end
