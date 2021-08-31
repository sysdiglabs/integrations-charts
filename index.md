---
title: Sysdig Promcat Helm Charts
description: Repository for Promcat's Helm charts.
---

## Add this charts repository to your local Helm

To start using our charts, first add this _charts repository_ using the `helm` command line tool:

```bash
# Add sysdiglab charts to helm
$ helm repo add promcat-charts https://sysdiglabs.github.io/integrations-charts 

# Update list of charts from all registered charts repositories
$ helm repo update
```

## Use this charts repository

Once you have added this _charts repository_ to your local `helm`, you can start using it:

```bash
# List all charts:
$ helm search repo promcat-charts
```

## Hosted charts in this repository

<ul>
{% for f in site.static_files %}
    {% if f.path contains "/charts/" and f.path contains "/README.md" %}
    {% assign path = f.path | replace: "/README.md", "" %}
    <li><a href="{{site.baseurl}}{{path}}">{{ path | remove_first: "/charts/" }}</a></li>
    {% endif %}
{% endfor %}
</ul>

See specific information about each _chart_ at the GitHub repository:
* [https://github.com/sysdiglabs/integrations-charts/tree/main/charts](https://github.com/sysdiglabs/integrations-charts/charts/tree/main/charts)
