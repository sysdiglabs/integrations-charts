# MySQL integration
This helm chart is part of the [integration of PromCat.io for mysql](https://promcat.io/apps/mysql) installs our version of the [MySQL Prometheus exporter](https://github.com/prometheus/mysqld_exporter).

Visit [PromCat.io](https://promcat.io/apps/mysql) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Prerequisites

1. Create the user and password for the exporter in the database:
```sql
CREATE USER 'exporter' IDENTIFIED BY 'YOUR-PASSWORD' WITH MAX_USER_CONNECTIONS 3;
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter';
```
> Substitute the user name and the password in the SQL sentence for your custom ones.

2. Create a `mysql-exporter.cnf` file with the credentials of the exporter:
```ini
[client]
user = exporter
password = "YOUR-PASSWORD"
host=YOUR-DB-IP
```

3. In your cluster, create the secret with the `mysql-exporter.cnf` file. This file will be mounted in the exporter to authenticate with the database:
```
kubectl create secret -n mysql generic mysql-exporter \
  --from-file=.my.cnf=./mysql-exporter.cnf
```

## SSL authentication
If your database requires SSL authentication, you need to create the secrets with the certificates:
To do so, create the secret with SSL certificates for the exporter:
```
kubectl create secret generic mysql-exporter-ssl \
  --from-file=ca.pem=./certs/ca.pem \
  --from-file=client-key.pem=./certs/client-key.pem \
  --from-file=client-cert.pem=./certs/client-cert.pem
```

In the `mysql-exporter.cnf` file, include the following lines to route to the certificates in the exporter:
```ini
[client]
user = exporter
password = "YOUR-PASSWORD"
host=YOUR-DB-IP
ssl-ca=/lib/cert/ca.pem
ssl-key=/lib/cert/client-key.pem
ssl-cert=/lib/cert/client-cert.pem
```
# Usage
## Stand-alone MySQL
Use the following command:

```
helm install my-release ./charts/mysql-exporter/
```

## Sysdig configuration

If you want to apply Sysdig configuration to these helm commands, add these other params to each helm command:

```
helm install my-release ./charts/mysql-exporter/ \
  --set sysdig.namespaceName="sysdig-agent" \
  --set sysdig.workloadType="statefulset" \
  --set sysdig.workloadName="mysql" \
  --set sysdig.exporterNamespaceName="mysql" \
  --set sysdig.integrationType="mysql"
```

- NamespaceName is the namespace where the mysql search is running
- WorkloadType is the workload type, can be: statefulset, deployment or daemonset
- WorkloadName is the workload name of the mysql, usually the name of the statefulset
- ExporterNamespaceName is the namespace where the exporter will be deployed
- IntegrationType is the name of the integration

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [MySQL exporter](https://github.com/prometheus/mysqld_exporter) with Apache v2 license. 