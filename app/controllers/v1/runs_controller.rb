module V1
  class RunsController < ApplicationController
    respond_to :json

    def create
      probe = Probe.find_by(uid: params[:probe_id])

      if probe
        RunBuilder.new(probe, params[:pings]).build
        render status: 201, json: ""
      else
        render status: 404, json: ""
      end
    end
  end
end
