# Nginx integration
This helm chart part of the [integration of PromCat.io for Php-Fpm](https://promcat.io/apps/php-fpm) and installs our version of the [php-fpm Prometheus exporter](https://github.com/hipages/php-fpm_exporter).

Visit [PromCat.io](https://promcat.io/apps/php-fpm) for dashboards, alerts and further documentation for this integration. 

# Requirements
* Helm v3

# Usage

Use the following options: 
```
helm template php-fpm ./charts/php-fpm-exporter
```
# Attributions
This helm chart is maintained by [Sysdig team](https://sysdig.com/).

Exporter and user queries: [Php-Fpm Exporter](https://github.com/hipages/php-fpm_exporter) with Apache v2 license. 