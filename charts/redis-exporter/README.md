# Redis integration
This helm chart is part of the [integration of PromCat.io for redis](https://promcat.io/apps/redis) installs our version of the [Redis Prometheus exporter](https://github.com/oliver006/redis_exporter).

Visit [PromCat.io](https://promcat.io/apps/redis) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## Stand-alone Redis
Use the following command:
```
helm install my-release ./charts/redis-exporter/
```

## Sysdig configuration

If you want to apply Sysdig configuration to these helm commands, add these other params to each helm command:

```
helm install my-release ./charts/redis-exporter/ \
  --set sysdig.namespaceName="redis" \
  --set sysdig.workloadType="deployment" \
  --set sysdig.workloadName="redis" \
  --set sysdig.exporterNamespaceName="redis" \
  --set sysdig.integrationType="redis"
```

- NamespaceName is the namespace where the redis is running
- WorkloadType is the workload type, can be: statefulset, deployment or daemonset
- WorkloadName is the workload name of the redis, usually the name of the statefulset
- ExporterNamespaceName is the namespace where the exporter will be deployed
- IntegrationType is the name of the integration

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Redis Exporter](https://github.com/oliver006/redis_exporter) with Apache v2 license. 