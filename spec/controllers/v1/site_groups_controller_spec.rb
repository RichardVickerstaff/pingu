require 'rails_helper'

describe V1::SiteGroupsController do

  describe '#samples' do
    let(:bbc){'http://www.bbc.co.uk'}
    let(:govuk){'http://www.gov.uk'}
    let(:google){'http://www.google.com'}
    let(:get_sites) { get "/site_groups/samples", {}, {'version' => 1} }

    context 'there are groups' do
      before do
        uk = FactoryGirl.create(:site_group, :uk)
        uk.sites << FactoryGirl.create(:site, url: bbc)
        uk.sites << FactoryGirl.create(:site, url: govuk)

        us = FactoryGirl.create(:site_group, :us)
        us.sites << FactoryGirl.create(:site, url: google)
      end

      it 'returns a sample of sites for each group' do
        expected = [
          {'group_name' =>  'UK', 'sample_urls' => [bbc, govuk]},
          {'group_name' => 'USA', 'sample_urls' =>    [google]}
        ]

        get_sites

        expect(json).to be_deep_equal expected
      end
    end

    context 'there are no groups' do
      it 'returns an empty array' do
        get_sites
        expect(json).to eq([])
      end
    end
  end
end
