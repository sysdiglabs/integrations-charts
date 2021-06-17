# ElasticSearch integration
This helm chart part of the [integration of PromCat.io for Elastic Search](https://promcat.io/apps/elasticsearch) installs our version of the [Elastic search Prometheus exporter](https://github.com/prometheus-community/elasticsearch_exporter).

Visit [PromCat.io](https://promcat.io/apps/elasticsearch) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## Stand-alone ElasticSearch without authentication
Use the following options: 
```
helm install -n sysdig-agent my-release ./charts/elasticSearch-exporter/ \
  --set namespaceName="logging" \
  --set workloadType="statefulset" \
  --set workloadName="elasticSearch" \
  --set url.name="elasticsearch:9200"
```

## Stand-alone ElasticSearch with authentication

```
kubectl create -n sysdig-agent secret generic elastic-config \
  --from-literal=username=userName \
  --from-literal=password=password
```

```
helm install -n sysdig-agent my-release ./charts/elasticSearch-exporter/ \
  --set namespaceName="logging" \
  --set workloadType="statefulset" \
  --set workloadName="elasticSearch" \
  --set url.name="$(ELASTIC_USER):$(ELASTICSEARCH_ADMIN_PASSWORD)@sysdigcloud-elasticsearch:9200"
  --set url.http="https"
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Elastic Search Exporter](https://github.com/prometheus-community/elasticsearch_exporter) with Apache v2 license. 