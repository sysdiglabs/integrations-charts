# Redis integration
This helm chart is part of the [integration of PromCat.io for redis](https://promcat.io/apps/redis) installs our version of the [Redis Prometheus exporter](https://github.com/oliver006/redis_exporter).

Visit [PromCat.io](https://promcat.io/apps/redis) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage
## Stand-alone Redis with NO TLS
Use the following command:
```
helm install -n sysdig-agent my-release ./charts/redis-exporter/ \
  --set namespaceName="sysdig-agent" \
  --set workloadType="deployment" \
  --set url.name="my-redis-url" \
  --set workloadName="redis"
```

## Stand-alone Redis with TLS
Use the following command:
```
helm install -n sysdig-agent my-release ./charts/redis-exporter/ \
  --set namespaceName="sysdig-agent" \
  --set workloadType="deployment" \
  --set workloadName="redis" \
  --set url.name="my-redis-url" \
  --set auth.enabled="true" \
  --set auth.secret.name="my-release-redis" \
  --set auth.secret.key="redis-password" \
  --set redisTlsConfig.enabled="true" \
  --set redisTlsConfig.caCertFile.secret.name="my-release-redis-crt" \
  --set redisTlsConfig.caCertFile.secret.key="ca.crt" \
  --set redisTlsConfig.clientKeyFile.secret.name="my-release-redis-crt" \
  --set redisTlsConfig.clientKeyFile.secret.key="tls.key" \
  --set redisTlsConfig.clientCertFile.secret.name="my-release-redis-crt" \
  --set redisTlsConfig.clientCertFile.secret.key="tls.crt"
```

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Redis Exporter](https://github.com/oliver006/redis_exporter) with Apache v2 license. 


helm install -n default redis-exporter ./charts/redis-exporter/ --set namespaceName="default" --set workloadType="deployment" --set workloadName="redis" --set auth.enabled="true" --set auth.secret.name="my-release-redis-cluster" --set auth.secret.key="redis-password" --set redisTlsConfig.enabled="true" --set redisTlsConfig.caCertFile.secret.name="my-release-redis-cluster-crt" --set redisTlsConfig.caCertFile.secret.key="ca.crt" --set redisTlsConfig.clientKeyFile.secret.name="my-release-redis-cluster-crt" --set redisTlsConfig.clientKeyFile.secret.key="tls.key" --set redisTlsConfig.clientCertFile.secret.name="my-release-redis-cluster-crt" --set redisTlsConfig.clientCertFile.secret.key="tls.crt"

helm install -n default redis-exporter ./charts/redis-exporter/ \
  --set namespaceName="default" \
  --set workloadType="deployment" \
  --set url.name="my-redis-url" \
  --set workloadName="redis"


  --set auth.enabled="true" --set auth.secret.name="my-release-redis-cluster" --set auth.secret.key="redis-password"