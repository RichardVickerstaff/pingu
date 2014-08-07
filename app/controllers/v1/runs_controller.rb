module V1
  class RunsController < ApplicationController
    respond_to :json

    def create
      probe = Probe.find_by(name: params[:probe_id])

      if probe
        RunBuilder.new(probe, params[:site_groups]).build
        render status: 201, json: ""
      else
        render status: 404, json: ""
      end
    end
  end
end
