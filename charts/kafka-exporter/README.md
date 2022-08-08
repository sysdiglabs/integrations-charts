# Kafka integration
This helm chart part of the [integration of PromCat.io for Kafka](https://promcat.io/apps/kafka) installs our version of the [Kafka Prometheus exporter](https://github.com/danielqsj/kafka_exporter).

Visit [PromCat.io](https://promcat.io/apps/kafka) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## Stand-alone Kafka

A Kafka cluster usually requires authentication for the Kafka-Exporter (or any Kafka client) to connect to it.
Please check the values.yaml to see the required flags for each authentication type (TLS, SASL+SCAM, SASL+Kerberos).

Example of a deployment for a Kakfa cluster without authentication:
```
helm install -n kafka my-kafka-exporter-release ./charts/kafka-exporter/ \
  --set namespaceName="kafka" \
  --set workloadType="statefulset" \
  --set workloadName="kafka" \
  --set exporterNamespaceName="kafka" \
  --set kafkaServer[0]=kafka-cp-kafka:9092 
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Kafka Exporter](https://github.com/danielqsj/kafka_exporter) with Apache v2 license. 