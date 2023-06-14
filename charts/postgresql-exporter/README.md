# PostgreSQL integration
This helm chart is part of the [integration of PromCat.io for PostgreSQL](https://promcat.io/apps/postgresql) and installs the [postgreSQL Prometheus exporter](https://github.com/wrouesnel/postgres_exporter).

Visit [PromCat.io](https://promcat.io/apps/postgresql) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Previous steps
Create the secret with the user and password in the namespace where the exporter will be deployed (by default, `sysdig-agent`):
```
# Without TLS certs
kubectl create -n sysdig-agent secret generic postgresql-exporter \
  --from-literal=username=userName \
  --from-literal=password=password

# With TLS certs
kubectl create -n sysdig-agent secret generic postgresql-exporter \
  --from-literal=username=userName \
  --from-literal=password=password \
  --from-file=sslRootCert=/path/to/tls/cert
```

# Usage
## Stand-alone PostgreSQL instance
Use the following options: 
```
helm install my-release ./charts/postgresql-exporter/ \
  --set dbInstance.host="your-db-host"
```
# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Postgres Exporter](https://github.com/wrouesnel/postgres_exporter) with Apache v2 license. 