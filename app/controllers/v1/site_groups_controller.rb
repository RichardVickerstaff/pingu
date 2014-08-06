module V1
  class SiteGroupsController < ApplicationController
    respond_to :json

    def samples
      @site_groups = SiteGroupSample.generate
    end

    def report
      @report = AveragePingReport.generate
    end
  end
end
