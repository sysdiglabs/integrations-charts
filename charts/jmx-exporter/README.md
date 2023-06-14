# JMX integration
This helm chart is part of several Java-based integrations of Promcat.io like [Kafka](https://promcat.io/apps/kafka) and installs our version of the [JMX Prometheus exporter](https://github.com/prometheus/jmx_exporter).

Visit [PromCat.io](https://promcat.io/) for dashboards, alerts and further documentation for these integrations. 

# Requirements
* Helm v3

# Usage

This Helm chart comes bundled with production-ready JMX configurations for the following integrations: Kafka, Cassandra. 

To automatically generate a ConfigMap with those configurations inside in your Namespace, set the 'integrationType' to the required integration, the JMX port, and the flag 'onlyCreateJMXConfigMap' as true:

```
helm -n yourNamespace install kafka-jmx-exporter ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=kafka --set onlyCreateJMXConfigMap=true

helm -n yourNamespace install cassandra-jmx-exporter ./charts/jmx-exporter --set jmx_port=7199 --set integrationType=cassandra --set onlyCreateJMXConfigMap=true
```

Then create the sidecar patch with the flag 'onlyCreateSidecarPatch' as true, and apply it to your application workload (possible values: deployment, statefulset, daemonset, pod). An example for a StatefulSet workload:
```
helm template kafka-jmx-exporter ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=kafka --set onlyCreateSidecarPatch=true > patch.yml
or
helm template cassandra-jmx-exporter ./charts/jmx-exporter --set jmx_port=7199 --set integrationType=cassandra --set onlyCreateSidecarPatch=true > patch.yml

kubectl -n yourNamespace patch sts yourStatefulSetWorkload --patch-file patch.yml
```

If you want to use your own ConfigMap with your own JMX configurations, deploy it beforehand, use the "custom" value as the 'integrationType', and set the 'customIntegrationTypeName' with the name of your application.

Examples:
```
helm template kafka-jmx-exporter ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=custom --set customIntegrationTypeName=kafka > patch.yml

helm template jenkins-jmx-exporter ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=custom --set customIntegrationTypeName=jenkins --set customJMXConfigMapName=my-jenkins-jmx-configmap > patch.yml

helm template minecraft-jmx-exporter ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=custom --set customIntegrationTypeName=minecraft > patch.yml
```

If you want the ConfigMap with the JMX configurations to have a different name than the custom "jmx-config", set the 'customJMXConfigMapName' with your desired name:

```
helm -n yourNamespace install template kafka-jmx-exporter ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=kafka --set onlyCreateJMXConfigMap=true --set customJMXConfigMapName=my-kafka-jmx-configmap

helm template jenkins-jmx-exporter ./charts/jmx-exporter --set jmx_port=9010 --set integrationType=custom --set customIntegrationTypeName=jenkins --set onlyCreateJMXConfigMap=true --set customJMXConfigMapName=my-jenkins-jmx-configmap > patch.yml
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [JMX Exporter](https://github.com/prometheus/jmx_exporter) with Apache v2 license. 
