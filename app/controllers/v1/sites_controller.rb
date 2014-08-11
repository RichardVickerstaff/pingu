module V1
  class SitesController < ApplicationController
    respond_to :json

    def sample
      @sample_sites = SiteGroupSample.generate
    end

  end
end
