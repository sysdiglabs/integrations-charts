# OracleDB integration
This helm chart is part of the [integration of PromCat.io for OracleDB](https://promcat.io/apps/oracle-database) and installs the [OracleDB Prometheus exporter](https://github.com/iamseth/oracledb_exporter).

Visit [PromCat.io](https://promcat.io/apps/oracle-database) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Previous steps
Create the secret with the Oracle Datasource in the namespace where the exporter will be deployed (by default, `sysdig-agent`):

```
# Secret ConfigMap
apiVersion: v1
kind: Secret
metadata:
  name:  oracledb-exporter-secret
  namespace: database-namespace
data:
    # Add here the result of:
    # echo -n YOUR_CONN_STRING | base64
    # YOUR_CONN_STRING be like: oracle://system:YOUR-PASSWORD-FOR-SYSTEM@database:1521/DB_SID.DB_DOMAIN
    datasource: XXX
type: Opaque
```

YOUR_CONN_STRING must be a value similar to this before encoding it with base64:

```
oracle://user:password@localhost:1521/xe
```

Apply ConfigMap:

```
kubectl apply -f oracledb-exporter-secret.yaml
```

# Usage
## Stand-alone Oracle Database instance
Use the following options: 

```
helm install my-release ./charts/oracledb-exporter/
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [OracleDB Exporter](https://github.com/iamseth/oracledb_exporter) with Apache v2 license. 