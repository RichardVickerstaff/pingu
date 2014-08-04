require 'rails_helper'

resource "Site Group" do

  pending get '/site_groups/report' do
    example 'Getting ping times' do
      expected =[
        {
          group_name: 'Location A',
          average_response_time: 150,
          failed_pings: 1
        },
        {
          group_name: 'Location B',
          average_response_time: 250,
          failed_pings: 4
        }
      ]

      do_request

      expect(status).to eq 200
      expect(response_body).to eq JSON.generate(expected)
    end
  end

  get '/site_groups/samples' do
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
