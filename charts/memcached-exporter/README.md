# Memcached integration
This helm chart is part of the [integration of PromCat.io for Memcached](https://promcat.io/apps/memcached) and installs our version of the [memcached Prometheus exporter](https://github.com/prometheus/memcached_exporter).

Visit [PromCat.io](https://promcat.io/apps/memcached) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage

Use the following options: 
```
helm template memcached ./charts/memcached-exporter
```
# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Memcached exporter: [Memcached Exporter](https://github.com/prometheus/memcached_exporter) with Apache v2 license. 
