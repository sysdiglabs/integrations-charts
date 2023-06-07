{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "oracledb-exporter.name" -}}
{{- printf "%s" .Chart.Name}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "oracledb-exporter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "oracledb-exporter.labels" -}}
helm.sh/chart: {{ include "oracledb-exporter.chart" . }}
{{ include "oracledb-exporter.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "oracledb-exporter.selectorLabels" -}}
app.kubernetes.io/name: {{ include "oracledb-exporter.name" . }}
{{- end }}

{{/*
Annotations
*/}}
{{- define "oracledb-exporter.sysdigAnnotations" -}}
promcat.sysdig.com/port: "{{ .Values.port }}"
promcat.sysdig.com/integration_type: {{ required "A valid integration type name for the application must be passed in .Values.integrationType" .Values.integrationType | quote }}
{{- end }}
{{- define "oracledb-exporter.prometheusAnnotations" -}}
prometheus.io/scrape: "true"
prometheus.io/port: "{{ .Values.port }}"
{{- end }}

{{/*
Create name of the exporter deployment
*/}}
{{- define "oracledb-exporter.exporterDeploymentName" -}}
{{- printf "%s-deploy" (include "oracledb-exporter.name" .) }}
{{- end }}

{{/*
Create name of the Metrics ConfigMap
*/}}
{{- define "oracledb-exporter.metricsName" -}}
{{- printf "%s-metrics" (include "oracledb-exporter.name" .) }}
{{- end }}