require 'rails_helper'
require 'rack/test'

describe 'Sites API' do

  describe 'get'  do
    before do
      FactoryGirl.create :site_group, :uk, :with_one_site
    end

    it 'returns a hash of sites to ping for each category' do
      get "/sites"
      expect(json).to eq({uk: ['www.bbc.co.uk']})
    end
  end
end
