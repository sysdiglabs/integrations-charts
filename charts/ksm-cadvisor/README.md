# KSM CaAdvisor

This chart deploys a Prometheus alongside with the kubernetes state metrics and the recording rules needed for the 

# Requirements
* Helm v3

# Usage
```
kubectl create ns monitoring
```

```
helm -n monitoring install <RELEASE_NAME> ksm-cadvisor --repo=https://sysdiglabs.github.io/integrations-charts \
--set prometheus.server.global.external_labels.kube_cluster_name=<YOUR_KUBERNETES_CLUSTER_NAME> \
--set prometheus.server.remoteWrite[0].url="<SYSDIG_COLLECTOR_URL>" \
--set prometheus.server.remoteWrite[0].bearer_token="<YOUR_SYSDIG_MONITOR_API_TOKEN>" \
--set prometheus.server.remoteWrite[0].tls_config.insecure_skip_verify=true \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].source_labels[0]=remote_write \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].regex="true" \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].action=keep
```

# Examples

```
kubectl create ns monitoring

helm -n monitoring install ksm-cadvisor-test-chart ksm-cadvisor --repo=https://sysdiglabs.github.io/integrations-charts \
--set prometheus.server.global.external_labels.kube_cluster_name=ksm-cadvisor \
--set prometheus.server.remoteWrite[0].url="https://api.sysdigcloud.com/prometheus/remote/write" \
--set prometheus.server.remoteWrite[0].bearer_token="foo123-bar456" \
--set prometheus.server.remoteWrite[0].tls_config.insecure_skip_verify=true \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].source_labels[0]=remote_write \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].regex="true" \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].action=keep
```

This will install our Helm chart that just deploy KSM and Prometheus with remote-write to Sysdig backend collector.

Since some KSM dashboards will only display data if there are Kubernetes Namespaces with quotas, we can create them like this:
```
kubectl create ns namespace-quotas-example
kubectl apply -f https://k8s.io/examples/admin/resource/quota-mem-cpu.yaml --namespace=namespace-quotas-example
kubectl apply -f https://k8s.io/examples/admin/resource/quota-pod.yaml --namespace=namespace-quotas-example
```

If we need to modify any parameters from Prometheus or even KSM (for example the KSM Docker image tag), we can just do it with '--set' parameters in the Helm deployment command.
For example, in the following command we added a '--set' parameter to modify the KSM version to 'v2.2.4':
```
helm -n monitoring install ksm-cadvisor-test-chart ksm-cadvisor --repo=https://sysdiglabs.github.io/integrations-charts \
--set prometheus.server.global.external_labels.kube_cluster_name=ksm-cadvisor \
--set prometheus.server.remoteWrite[0].url="https://api.sysdigcloud.com/prometheus/remote/write" \
--set prometheus.server.remoteWrite[0].bearer_token="foo123-bar456" \
--set prometheus.server.remoteWrite[0].tls_config.insecure_skip_verify=true \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].source_labels[0]=remote_write \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].regex="true" \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].action=keep \
--set prometheus.kube-state-metrics.image.tag="v2.2.4"
```

Another example is, if there is already a KSM deployed in the Kubernetes cluster, you can make the Helm chart deploy only Prometheus without KSM (having 2 KSM will make Prometheus have 'duplicated timeseries with different labels' errors):
```
helm -n monitoring install ksm-cadvisor-test-chart ksm-cadvisor --repo=https://sysdiglabs.github.io/integrations-charts \
--set prometheus.server.global.external_labels.kube_cluster_name=ksm-cadvisor \
--set prometheus.server.remoteWrite[0].url="https://api.sysdigcloud.com/prometheus/remote/write" \
--set prometheus.server.remoteWrite[0].bearer_token="foo123-bar456" \
--set prometheus.server.remoteWrite[0].tls_config.insecure_skip_verify=true \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].source_labels[0]=remote_write \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].regex="true" \
--set prometheus.server.remoteWrite[0].write_relabel_configs[0].action=keep \
--set prometheus.kubeStateMetrics.enabled=false
```
