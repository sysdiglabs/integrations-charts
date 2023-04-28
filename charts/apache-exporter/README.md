# Apache integration
This helm chart is part of the [integration of PromCat.io for Apache](https://promcat.io/apps/apache) and installs our version of the [apache Prometheus exporter](https://github.com/Lusitaniae/apache_exporter).

Visit [PromCat.io](https://promcat.io/apps/apache) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage

Use the following options: 
```
helm template apache ./charts/apache-exporter
```

## Sysdig configuration

If you want to apply Sysdig configuration to these helm commands, add these other params to each helm command:

```
helm template apache ./charts/apache-exporter \
  --set integrationType="apache"
```

- IntegrationType is the name of the integration

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Apache exporter: [Apache Exporter](https://github.com/Lusitaniae/apache_exporter) with Apache v2 license. 
Grok exporter: [Grok Exporter](https://github.com/fstab/grok_exporter) with Apache v2 license. 