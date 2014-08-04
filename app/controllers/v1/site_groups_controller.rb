module V1
  class SiteGroupsController < ApplicationController
    respond_to :json

    def samples
      @site_groups = SiteGroup.all
    end
  end
end
