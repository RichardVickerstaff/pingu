require 'rails_helper'

describe V1::SiteGroupsController, type: :controller do
  let(:us) { FactoryGirl.build(:site_group, :us) }
  let(:uk) { FactoryGirl.build(:site_group, :uk) }

  # TODO: Make this a SPEC instead of INTEGRATION
  describe 'GET samples' do
    let(:sites) { 3.times.map{|_| Faker::Internet.url} }

    context 'there are groups' do
      before do
        allow(uk).to receive(:sample_sites).and_return sites[1..2]
        allow(us).to receive(:sample_sites).and_return sites[3]
        allow(SiteGroup).to receive(:all).and_return [uk, us]
      end

      it 'returns a sample of sites for each group' do
        expected = [
          {'group_name' =>  'UK', 'sample_urls' => sites[1..2]},
          {'group_name' => 'USA', 'sample_urls' => sites[3]}
        ]

        get :samples
        expect(json).to eq expected
      end
    end

    context 'there are no groups' do
      it 'returns an empty array' do
        get :samples
        expect(json).to eq([])
      end
    end
  end

  describe 'GET report' do
    let(:report) { double :report }

    before { allow(AveragePingReport).to receive(:generate).and_return report}

    it 'assigns @report' do
      get :report
      expect(assigns[:report]).to eq report
    end
  end

end
