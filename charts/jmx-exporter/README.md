# JMX integration
This helm chart is part of several Java-based integrations of Promcat.io like [Kafka](https://promcat.io/apps/kafka) and installs our version of the [JMX Prometheus exporter](https://github.com/prometheus/jmx_exporter).

Visit [PromCat.io](https://promcat.io/) for dashboards, alerts and further documentation for these integrations. 

# Requirements
* Helm v3

# Usage

This Helm chart comes bundled with production-ready JMX configurations for the following integrations: Kafka, Cassandra. 

To automatically generate a ConfigMap with those configurations inside, set the 'integrationType' to the required integration, and the JMX port:

```
helm template jmx ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=kafka

helm template jmx ./charts/jmx-exporter --set jmx_port=7199 integrationType=cassandra
```

Then deploy the ConfigMap, and apply the patch with the JMX-Exporter as a sidecar into your workload (deployment, statefulset...):
```
kubectl apply -f jmx-config.yaml

kubectl patch statefulset kafka --patch-file patch-file.yaml
```

If you want to use your own ConfigMap with your own JMX configurations, deploy it beforehand, use the "custom" value as the 'integrationType', set the 'customIntegrationTypeName' with the name of your application.

Examples:
```
helm template jmx ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=custom --set customIntegrationTypeName=kafka

helm template jmx ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=custom --set customIntegrationTypeName=jenkins --set customJMXConfigMapName=my-jenkins-jmx-configmap

helm template jmx ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=custom --set customIntegrationTypeName=minecraft
```

If you want the ConfigMap with the JMX configurations to have a different name than the custom "jmx-config", aset the 'customJMXConfigMapName' with your desired name:

```
helm template jmx ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=kafka  --set customJMXConfigMapName=my-kafka-jmx-configmap

helm template jmx ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=custom --set customIntegrationTypeName=jenkins --set customJMXConfigMapName=my-jenkins-jmx-configmap
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [JMX Exporter](https://github.com/prometheus/jmx_exporter) with Apache v2 license. 
