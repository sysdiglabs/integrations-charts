# Php-fpm integration
This helm chart is part of the [integration of PromCat.io for Php-Fpm](https://promcat.io/apps/php-fpm) and installs our version of the [php-fpm Prometheus exporter](https://github.com/hipages/php-fpm_exporter).

Visit [PromCat.io](https://promcat.io/apps/php-fpm) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage

Use the following options: 
```
helm template php-fpm ./charts/php-fpm-exporter
```

## Sysdig configuration

If you want to apply Sysdig configuration to these helm commands, add these other params to each helm command:

```
helm template php-fpm ./charts/php-fpm-exporter --set sysdig.integrationType="php-fpm"
```

- IntegrationType is the name of the integration

# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Php-Fpm Exporter](https://github.com/hipages/php-fpm_exporter) with Apache v2 license. 
