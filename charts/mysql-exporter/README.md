# MySQL integration
This helm chart part of the [integration of PromCat.io for mysql](https://promcat.io/apps/mysql) installs our version of the [MySQL Prometheus exporter](https://github.com/prometheus/mysqld_exporter).

Visit [PromCat.io](https://promcat.io/apps/mysql) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## Stand-alone MySQL
Use the following command:

```
kubectl create secret -n mysql generic mysql-exporter \
  --from-file=.my.cnf=./mysql-exporter.cnf
```

```
helm install -n sysdig-agent my-release ./charts/mysql-exporter/ \
  --set namespaceName="sysdig-agent" \
  --set workloadType="statefulset" \
  --set workloadName="mysql"
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [MySQL exporter](https://github.com/prometheus/mysqld_exporter) with Apache v2 license. 