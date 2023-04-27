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
helm install -n sysdig-agent my-release ./charts/postgresql-exporter/ \
  --set dbInstance.host="your-db-host"
```

## Sysdig configuration

If you want to apply Sysdig configuration to these helm commands, add these other params to each helm command:

```
  --set sysdig.namespaceName="postgres-ns" \
  --set sysdig.workloadType="deployment" \
  --set sysdig.workloadName="postgresdb" \
  --set sysdig.exporterNamespaceName= "sysdig-agent" \
  --set sysdig.integrationType="postgresql"
```

- NamespaceName is the namespace where the postgresql is running
- WorkloadType is the workload type, can be: statefulset, deployment or daemonset
- WorkloadName is the workload name of the postgresql, usually the name of the statefulset
- ExporterNamespaceName is the namespace where the exporter will be deployed
- IntegrationType is the name of the integration

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Postgres Exporter](https://github.com/wrouesnel/postgres_exporter) with Apache v2 license. 