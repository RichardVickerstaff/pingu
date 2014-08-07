module V1
  class ProbesController < ApplicationController
    respond_to :json

    def index
      @probe_report = ProbeReport.generate
    end
  end
end
