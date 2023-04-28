{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "memcached-exporter.name" -}}
{{- printf "%s-%s-%s" (default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-") .Values.namespaceName .Values.workloadName }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name. Trunc to 55 (63 - "-deploy").
*/}}
{{- define "memcached-exporter.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 55 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Chart.Name .Values.namespaceName .Values.workloadName | trunc 55 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "memcached-exporter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "memcached-exporter.labels" -}}
helm.sh/chart: {{ include "memcached-exporter.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Annotations
*/}}
{{- define "memcached-exporter.sysdigAnnotations" -}}
promcat.sysdig.com/port: "{{ .Values.port }}"
promcat.sysdig.com/integration_type: {{ required "A valid integration type name for the application must be passed in .Values.sysdig.integrationType" .Values.sysdig.integrationType | quote }}
{{- end }}
{{- define "memcached-exporter.prometheusAnnotations" -}}
prometheus.io/scrape: "true"
prometheus.io/port: "{{ .Values.port }}"
{{- end }}

{{/*
Create name of the exporter deployment
*/}}
{{- define "memcached-exporter.exporterDeploymentName" -}}
{{- printf "%s-deploy" (include "memcached-exporter.fullname" .) }}
{{- end }}
