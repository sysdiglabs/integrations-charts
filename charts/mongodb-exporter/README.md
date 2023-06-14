# Mongodb integration
This helm chart is part of the [integration of PromCat.io for mondogdb](https://promcat.io/apps/mongodb) installs our version of the [Mongodb Prometheus exporter](https://github.com/percona/mongodb_exporter).

Visit [PromCat.io](https://promcat.io/apps/mongodb) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## Stand-alone Mongodb
Use the following command:
```
helm install my-release ./charts/mongodb-exporter/
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [MongoDB Exporter](https://github.com/percona/mongodb_exporter) with Apache v2 license. 