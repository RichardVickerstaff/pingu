class SitesController < ApplicationController
  respond_to :json

  def index
    respond_with({uk: ['www.bbc.co.uk']})
  end
end
