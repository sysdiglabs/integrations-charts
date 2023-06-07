# OracleDB integration
This helm chart is part of the [integration of PromCat.io for OracleDB](https://promcat.io/apps/oracle-database) and installs the [OracleDB Prometheus exporter](https://github.com/iamseth/oracledb_exporter).

Visit [PromCat.io](https://promcat.io/apps/oracle-database) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Previous steps
### Create OracleDB user and grant permission

Create a user for monitoring in Oracle Database.

Make sure you grant SELECT permission for the monitoring user on the following tables:

```
dba_tablespace_usage_metrics
dba_tablespaces
v$system_wait_class
v$asm_diskgroup_stat
v$datafile
v$sysstat
v$process
v$waitclassmetric
v$session
v$resource_limit
```


### Create Credentials for OracleDB Exporter

Create the secret with the Oracle Datasource in the namespace where the exporter will be deployed:

```
kubectl create secret -n 'EXPORTER-NAMESPACE' generic oracledb-exporter-secret --from-literal=datasource="YOUR_CONNECTION_STRING"
```

YOUR_CONN_STRING be like: `oracle://user:password@hostname:1521/DB_SID`

# Usage
## Stand-alone Oracle Database instance
Use the following options: 

```
helm install my-release ./charts/oracledb-exporter/
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [OracleDB Exporter](https://github.com/iamseth/oracledb_exporter) with Apache v2 license. 