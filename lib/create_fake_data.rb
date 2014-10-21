#!/usr/bin/env ruby
#
ENV["RAILS_ENV"] = "development"
require_relative '../config/environment'

DatabaseCleaner.clean_with(:truncation)

include FactoryGirl::Syntax::Methods

#Probes spec
probe = create :probe
run = probe.runs.create attributes_for :run
site = create :site
run.pings.create attributes_for :ping, site_id: site.id

#Site spec
create :site_group, :with_one_site


#Site group spec
probes = create_list :probe, 2
normal_ping_1 = create :ping, response_ms: 50
normal_ping_2 = create :ping, response_ms: 50
failed_ping = create :ping, :failed
long_ping = create :ping, response_ms: 200
site_group_a = create :site_group, name: "Location A"
site_group_b = create :site_group, name: "Location B"
run_1 = probes.first.runs.create attributes_for(:run)
run_2 = probes.last.runs.create attributes_for(:run)
site_1 = site_group_a.sites.create attributes_for(:site)
site_2 = site_group_b.sites.create attributes_for(:site)
site_3 = site_group_b.sites.create attributes_for(:site)
site_4 = site_group_b.sites.create attributes_for(:site)

long_ping.site =   site_1
normal_ping_1.site = site_2
normal_ping_2.site = site_3
failed_ping.site =  site_4

run_1.pings << long_ping << normal_ping_1
run_2.pings  << failed_ping << normal_ping_2




system 'bundle exec rails s -p 3003'
