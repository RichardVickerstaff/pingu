API Design Notes
================

```
get  /                      => routes index

get  /probes                => Probes[] : {probe_name: 'foo', pings[]}
put  /probes/:name          => Find/Create/Update probe
post /probes/:name/run      => Create new Run + pings

get  /site_group            => SiteGroups[] : {group_name: 'bar', sites[]}
post /site_group            => Create SiteGroup
post /site_group/:name/site => Site.create
get  /site_group/report     => SiteGroups[] : {group_name: 'bar', average_response_ms: 23}
get  /site_group/sample     => SiteGroups[] : {group_name: 'bar', sample_urls: ['http://foo.com']
```


[ Posts ] -< [ Runs ] -< [ Pings ] >- [ Sites ] >- [ SiteGroups ]
  -IP          -Time       -ms          -url         -Name
  -Name
  -Loc
