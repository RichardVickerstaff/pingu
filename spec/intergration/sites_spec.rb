require "rails_helper"

resource "Sites" do
  header "Content-type", "application/json"

  get "/sites/sample" do
    let!(:group) { FactoryGirl.create :site_group, :with_one_site }

    example "Sample of sites to poll" do
      expected = {sites: group.sites.map(&:url)}

      do_request

      expect(status).to eq 200
      expect(response_body).to eq JSON.generate(expected)
    end

  end
end
