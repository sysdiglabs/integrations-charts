# ElasticSearch integration
This helm chart part of the [integration of PromCat.io for Elastic Search](https://promcat.io/apps/elasticsearch) installs our version of the [Elastic search Prometheus exporter](https://github.com/prometheus-community/elasticsearch_exporter).

Visit [PromCat.io](https://promcat.io/apps/elasticsearch) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Prerequisites
## Create The Secret For The URL
#### Without Authentication
```sh
kubectl -n Your-Application-Namespace create secret generic elastic-url-secret --from-literal=url='http://SERVICE:PORT'
```

#### With Basic Auth
```sh
kubectl -n Your-Application-Namespace create secret generic elastic-url-secret --from-literal=url='https://USERNAME:PASSWORD@SERVICE:PORT'
```
NOTE: You can use either http or https in the URL.

# Usage
## ElasticSearch without custom certificates
```
helm install -n sysdig-agent my-release ./charts/elasticSearch-exporter/ \
  --set namespaceName="logging" \
  --set workloadType="statefulset" \
  --set workloadName="elasticsearch" \
  --set secretURL="elastic-url-secret"
```
## ElasticSearch with custom certificates
### Create The Secret For The TLS certs
Only needed in the case you are using https with custom certificates.
```sh
kubectl create -n Your-Application-Namespace secret generic elastic-tls-secret \
  --from-file=root-ca.crt=/path/to/tls/ca-cert \
  --from-file=root-ca.key=/path/to/tls/ca-key \
  --from-file=root-ca.pem=/path/to/tls/ca-pem
```
```
helm install -n sysdig-agent my-release ./charts/elasticsearch-exporter/ \
  --set namespaceName="logging" \
  --set workloadType="statefulset" \
  --set workloadName="elasticsearch" \
  --set secretURL="elastic-url-secret" \
  --set secretTLS="elastic-tls-secret"
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Elastic Search Exporter](https://github.com/prometheus-community/elasticsearch_exporter) with Apache v2 license. 