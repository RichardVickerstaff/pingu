class ProbeReport
  LatestPingReport = Struct.new(:name, :location, :ip, :pings)

  def self.generate
    probes = Probe.all
    probes.map { |probe|
      pings = probe.latest_pings.map { |ping| {response_ms: ping.response_ms, url: ping.url } }
      LatestPingReport.new(probe.name, probe.location, probe.ip, pings)
    }
  end
end
