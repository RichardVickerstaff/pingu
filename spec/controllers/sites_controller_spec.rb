require 'rails_helper'

describe SitesController do
  describe '#index' do
    let(:bbc){'http://www.bbc.co.uk'}
    let(:govuk){'http://www.gov.uk'}
    let(:google){'http://www.google.com'}

    before do
      uk = FactoryGirl.create(:site_group, :uk)
      uk.sites << FactoryGirl.create(:site, url: bbc)
      uk.sites << FactoryGirl.create(:site, url: govuk)

      us = FactoryGirl.create(:site_group, :us)
      us.sites << FactoryGirl.create(:site, url: google)
    end

    it 'returns a sample of sites for each group' do
      get "/sites"
      expect(json).to eq({UK: [bbc, govuk], USA: [google]})
    end
  end
end
