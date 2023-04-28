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
helm install my-kafka-exporter-release ./charts/kafka-exporter/ \
  --set kafkaServer[0]=kafka-cp-kafka:9092
```

Example of Kafka-Exporter with TLS auth:
```
helm install my-kafka-exporter-release ./charts/kafka-exporter/ \
  --set kafkaServer[0]=kafka-cp-kafka:9092 \
  --set tls.enabled=true \
  --set tls.insecureSkipVerify=false \
  --set tls.serverName="kafkaServerName" \
  --set tls.secretName="kafka-exporter-certs"
```

Example of Kafka-Exporter with SASL+SCRAM auth:
```
helm install my-kafka-exporter-release ./charts/kafka-exporter/ \
  --set kafkaServer[0]=kafka-cp-kafka:9092 \
  --set sasl.enabled=true \
  --set sasl.handshake=true \
  --set sasl.scram.enabled=true \
  --set sasl.scram.mechanism="plain" \
  --set sasl.scram.secretName="kafka-exporter-sasl-scram"
```

Example of Kafka-Exporter with SASL+Kerberos auth:
```
helm install my-kafka-exporter-release ./charts/kafka-exporter/ \
  --set kafkaServer[0]=kafka-cp-kafka:9092 \
  --set sasl.enabled=true \
  --set sasl.handshake=true \
  --set sasl.kerberos.enabled=true \
  --set sasl.kerberos.serviceName="kerberos-service" \
  --set sasl.kerberos.realm="kerberos-realm" \
  --set sasl.kerberos.kerberosAuthType="keytabAuth" \
  --set sasl.kerberos.secretName="kafka-exporter-sasl-kerberos"
```

## Sysdig configuration

If you want to apply Sysdig configuration to these helm commands, add these other params to each helm command:

```
helm install my-kafka-exporter-release ./charts/kafka-exporter/ \
  --set kafkaServer[0]=kafka-cp-kafka:9092 \
  --set sysdig.namespaceName="kafka" \
  --set sysdig.workloadType="statefulset" \
  --set sysdig.workloadName="kafka" \
  --set sysdig.integrationType="kafka"
```

- NamespaceName is the namespace where the kafka is running
- WorkloadType is the workload type, can be: statefulset, deployment or daemonset
- WorkloadName is the workload name of the kafka, usually the name of the statefulset
- IntegrationType is the name of the integration

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Kafka Exporter](https://github.com/danielqsj/kafka_exporter) with Apache v2 license. 