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

## Sysdig configuration

If you want to apply Sysdig configuration to these helm commands, add these other params to each helm command:

```
helm install my-release ./charts/mongodb-exporter/ \
  --set sysdig.namespaceName="sysdig-agent" \
  --set sysdig.workloadType="deployment" \
  --set sysdig.workloadName="mongodb" \
  --set sysdig.exporterNamespaceName="mongodb" \
  --set sysdig.integrationType="mongodb"
```

- NamespaceName is the namespace where the mongodb is running
- WorkloadType is the workload type, can be: statefulset, deployment or daemonset
- WorkloadName is the workload name of the mongodb, usually the name of the statefulset
- ExporterNamespaceName is the namespace where the exporter will be deployed
- IntegrationType is the name of the integration

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [MongoDB Exporter](https://github.com/percona/mongodb_exporter) with Apache v2 license. 