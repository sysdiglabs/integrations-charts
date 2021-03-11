# PromCat Postgres integration
This helm chart part of the [integration of PromCat.io for PostgreSQL](https://promcat.io/apps/postgresql) and installs the [postgreSQL Prometheus exporter](https://github.com/wrouesnel/postgres_exporter).

Visit [PromCat.io](https://promcat.io/apps/postgresql) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## Stand-alone PostgreSQL instance
Use the following options: 
```
helm install my-release ./promcat-postgresql/ \
  --set dbInstance.host="your-db-host" \
  --set dbInstance.user="user" \
  --set dbInstance.password="password" 
```

## Postgres in AWS RDS
```
helm install my-release ./promcat-postgresql/ \
  --set dbInstance.host="your-db-host" \
  --set dbInstance.user="user" \
  --set dbInstance.password="password" \
  --set exporterParams.excludeDatabases="rdsadmin"
```

## Postgres in Google Cloud SQL
```
helm install my-release ./promcat-postgresql/ \
  --set dbInstance.host="your-db-host" \
  --set dbInstance.user="user" \
  --set dbInstance.password="password" 
```

## Postgres in Azure 
```
helm install my-release ./promcat-postgresql/ \
  --set dbInstance.host="your-db-host" \
  --set dbInstance.user="user@your-db-name" \
  --set dbInstance.password="password" \
  --set dbInstance.sslmode="require" \
  --set exporterParams.autoDiscoverDatabases=false
```

## Postgres in IBM Cloud
```
helm install my-release ./promcat-postgresql/ \
  --set dbInstance.host="your-db-host" \
  --set dbInstance.port="<YOUR-INSTANCE-PUBLIC-PORT>" \
  --set dbInstance.user="user" \
  --set dbInstance.password="password" \
  --set dbInstance.sslmode="require" \
  --set dbInstance.sslRootCertEnabled=true \
  --set dbInstance.sslRootCert="$(cat YOUR-SSL-ROOT-CERT)" 
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Postgres Exporter](https://github.com/wrouesnel/postgres_exporter) with Apache v2 license. 