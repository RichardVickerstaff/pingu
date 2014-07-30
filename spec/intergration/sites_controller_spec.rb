require 'rails_helper'

resource "Sites" do
  get '/sites' do
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
