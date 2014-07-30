module V1
  class SitesController < ApplicationController
    respond_to :json

    def index
      @site_groups = SiteGroup.all
    end
  end
end
