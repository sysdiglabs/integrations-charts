# Redis integration
This helm chart is part of the [integration of PromCat.io for redis](https://promcat.io/apps/redis) installs our version of the [Redis Prometheus exporter](https://github.com/oliver006/redis_exporter).

Visit [PromCat.io](https://promcat.io/apps/redis) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## Stand-alone Redis
Use the following command:
```
helm install -n sysdig-agent my-release ./charts/redis-exporter/ \
  --set namespaceName="sysdig-agent" \
  --set workloadType="deployment" \
  --set workloadName="redis"
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Redis Exporter](https://github.com/oliver006/redis_exporter) with Apache v2 license. 