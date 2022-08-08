# NTP integration
This helm chart is part of the [integration of PromCat.io for NTP](https://promcat.io/apps/ntp) installs our version of the [NTP Prometheus exporter](https://github.com/sapcc/ntp_exporter).

Visit [PromCat.io](https://promcat.io/apps/ntp) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## NTP
```
helm install -n sysdig-agent my-release ./charts/ntp-exporter/ \
  --set namespaceName="logging" \
  --set workloadType="statefulset" \
  --set workloadName="ntp" \
  --set server="myNTPServer"
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [NTP Exporter](https://github.com/sapcc/ntp_exporter) with Apache v2 license. 