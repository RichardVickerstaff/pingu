module V1
  class SitesController < ApplicationController
    respond_to :json

    def index
      respond_with SiteGroup.all.each_with_object({}) {|group, output| output[group.name] = group.sample_sites}
    end
  end
end
