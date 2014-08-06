class AveragePingReport
  AveragePing = Struct.new(:group_name, :average_ping)

  def self.generate
    recent_pings = Probe.alive.to_a.map(&:latest_pings)
    average_pings = recent_pings.flatten.group_by(&:site_group)
      .map do |group, pings|
      responded = pings.select(&:responded?)
      average = responded.map(&:response_ms).inject(:+) / responded.length
      AveragePing.new(group.name, average)
    end

    average_pings
  end
end
