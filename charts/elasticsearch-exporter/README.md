# ElasticSearch integration
This helm chart part of the [integration of PromCat.io for Elastic Search](https://promcat.io/apps/elasticsearch) installs our version of the [Elastic search Prometheus exporter](https://github.com/prometheus-community/elasticsearch_exporter).

Visit [PromCat.io](https://promcat.io/apps/elasticsearch) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Prerequisites

If you are usin BASIC AUTH in order to connect to your Elasticsearch, then you will need to create a proper secret for those username and password needed to connect to your elasticsearch.

## Create The Secret For The User and Password
```sh
kubectl -n Your-Exporter-Namespace create secret generic elastic-user-pass-secret \
  --from-literal=username='<your-username>' --from-literal=password='<your-password>'
```

## ElasticSearch without custom certificates
```
helm install my-release ./charts/elasticsearch-exporter/
```

### ElasticSearch without custom certificates and Basic Auth
```
helm install my-release ./charts/elasticsearch-exporter/ \
  --set url.secretName="elastic-user-pass-secret"
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
helm install my-release ./charts/elasticsearch-exporter/ \
  --set secretTLS="elastic-tls-secret"
```
### ElasticSearch wit custom certificates and Basic Auth
```
helm install my-release ./charts/elasticsearch-exporter/ \
  --set secretTLS="elastic-tls-secret" \
  --set url.secretName="elastic-user-pass-secret"
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Elastic Search Exporter](https://github.com/prometheus-community/elasticsearch_exporter) with Apache v2 license. 
