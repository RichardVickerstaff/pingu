class AveragePingReport
  AveragePing = Struct.new(:group_name, :average_ping)

  def self.generate
    recent_pings = Probe.alive.map(&:latest_pings)
    recent_pings.group_by(&:site_group)
      .map do |group, pings|
      responded = pings.select(&:responded?)
      average = responded.map(&:response_ms).inject(:+) / responded.length
      AveragePing.new(group_name, average)
    end

  end


end
