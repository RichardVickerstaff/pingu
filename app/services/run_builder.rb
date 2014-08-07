require 'json'

class RunBuilder
  def initialize probe, run
    @probe = probe
    @run_data = run
  end

  def build
    run = @probe.runs.create
    @run_data.each do |site_group|
      site_group['pings'].each do |ping|
        site_id = Site.find_by(url: ping['site_name']).id
        ping = run.pings.create(response_ms: ping["response_ms"].to_i, site_id: site_id)
      end
    end
  end
end
