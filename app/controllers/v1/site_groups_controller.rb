module V1
  class SiteGroupsController < ApplicationController
    respond_to :json

    def report
      @report = AveragePingReport.generate
    end
  end
end
