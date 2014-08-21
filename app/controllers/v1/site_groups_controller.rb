module V1
  class SiteGroupsController < ApplicationController
    respond_to :json

    def report
      @report = AveragePingReport.new.generate
    end
  end
end
