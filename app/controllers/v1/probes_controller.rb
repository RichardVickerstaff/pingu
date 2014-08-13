module V1
  class ProbesController < ApplicationController
    respond_to :json

    def index
      @probe_report = ProbeReport.generate
    end

    def update
      probe = Probe.find_or_initialize_by(uid: params[:id])
      probe.update(uid: params[:id], location: params[:probe][:location], ip: params[:probe][:ip])

      render status: 201, json: ""
    end
  end
end
