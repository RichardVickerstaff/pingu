require 'rails_helper'

describe V1::SitesController do
  describe '#index' do
    let(:bbc){'http://www.bbc.co.uk'}
    let(:govuk){'http://www.gov.uk'}
    let(:google){'http://www.google.com'}

    context 'there are groups' do
      before do
        uk = FactoryGirl.create(:site_group, :uk)
        uk.sites << FactoryGirl.create(:site, url: bbc)
        uk.sites << FactoryGirl.create(:site, url: govuk)

        us = FactoryGirl.create(:site_group, :us)
        us.sites << FactoryGirl.create(:site, url: google)
      end

      it 'returns a sample of sites for each group' do
        get "/sites", {}, {'version' => 1}
        expect(json[:UK]).to match_array [bbc, govuk]
        expect(json[:USA]).to match_array [google]
      end
    end

    context 'there are no groups' do
      it 'returns an empty hash' do
        get "/sites", {}, {'version' => 1}
        expect(json).to eq({})
      end
    end
  end
end
