# NTP integration
This helm chart is part of the [integration of PromCat.io for NTP](https://promcat.io/apps/ntp) installs our version of the [NTP Prometheus exporter](https://github.com/sapcc/ntp_exporter).

Visit [PromCat.io](https://promcat.io/apps/ntp) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## NTP
```
helm install -n sysdig-agent my-release ./charts/ntp-exporter/ \
  --set server="myNTPServer"
```

## Sysdig configuration

If you want to apply Sysdig configuration to these helm commands, add these other params to each helm command:

```
  --set sysdig.namespaceName="sysdig-agent" \
  --set sysdig.workloadType="daemonset" \
  --set sysdig.workloadName="ntp" \
  --set sysdig.exporterNamespaceName="sysdig-agent" \
  --set sysdig.integrationType="ntp"
```

- NamespaceName is the namespace where the ntp is running
- WorkloadType is the workload type, can be: statefulset, deployment or daemonset
- WorkloadName is the workload name of the ntp, usually the name of the statefulset
- ExporterNamespaceName is the namespace where the exporter will be deployed
- IntegrationType is the name of the integration

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [NTP Exporter](https://github.com/sapcc/ntp_exporter) with Apache v2 license. 