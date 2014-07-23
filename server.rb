require 'sinatra'
require 'haml'
require 'json'

GET_TIMEOUT = -1

PingReport = Struct.new(:time, :average_ping, :failed_pings)

configure do
  @@ping_reports = {}
end

def ping_samples
{
  uk:            %w[http://www.gov.uk          http://bbc.co.uk            http://bt.co.uk       http://www.bankofengland.co.uk http://www.royal.gov.uk],
  eu:            %w[http://europa.eu           http://www.eurid.eu         http://web.de         http://www.italia.it           http://www1.interno.gov.it],
  oceania:       %w[http://australia.gov.au    http://www.heraldsun.com.au http://nzherald.co.nz http://newzealand.govt.nz      http://www.parliament.nz],
  africa:        %w[http://nairaland.com       http://masrawy.com          http://akhbarak.net   http://news24.com],
  north_america: %w[http://adamwhittingham.com http://www.google.com       http://redit.com      http://www.facebook.com],
  south_america: %w[http://lan.com             http://terra.com.co         http://scielo.cl      http://ladb.org                http://paho.org],
  asia:          %w[http://singa.com           http://mop.com              http://soho.com       http://yahoo.co.jp             http://ameblo.jp],
  video:         %w[],
  parental:      %w[],
  https:         %w[]
}
  .each_with_object({}) do |(group, sites), result|
    result[group] = sites.sample(3)
  end
end

get '/' do
  haml :index
end

post '/pings' do
  name  = params['name']
  region_pings = params['pings']

  puts "#{name} reported"

  average_by_region = JSON.parse(region_pings).each_with_object({}) do |(region, report), results|
    failed_pings = report.select{|n| n<0}
    success_pings = report.reject{|n| n<0}
    average_ping = if success_pings.empty?
                     GET_TIMEOUT
                   else
                     success_pings.inject(0.0){|sum, n| sum + n} / success_pings.size
                   end

    results[region] = PingReport.new(Time.now, average_ping.round(2), failed_pings.size).to_h
  end

  @@ping_reports[name] = average_by_region
  puts @@ping_reports
  status 200
end

get '/pings' do
  JSON.generate @@ping_reports.sort.to_h
end

get '/sites' do
  JSON.generate ping_samples
end
