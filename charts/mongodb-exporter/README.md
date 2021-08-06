# Mongodb integration
This helm chart part of the [integration of PromCat.io for mondogdb](https://promcat.io/apps/mongodb) installs our version of the [Mongodb Prometheus exporter](https://github.com/percona/mongodb_exporter).

Visit [PromCat.io](https://promcat.io/apps/mongodb) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## Stand-alone Mongodb
Use the following command:
```
helm install -n sysdig-agent my-release ./charts/mongodb-exporter/ \
  --set namespaceName="sysdig-agent" \
  --set workloadType="deployment" \
  --set workloadName="mongodb"
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Redis Exporter](https://github.com/percona/mongodb_exporter) with Apache v2 license. 