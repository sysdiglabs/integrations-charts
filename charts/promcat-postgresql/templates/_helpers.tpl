{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "promcat-postgresql.name" -}}
{{- printf "%s-%s" (default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-") .Release.Name }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "promcat-postgresql.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" ($name | trunc 63 | trimSuffix "-") .Release.Name }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "promcat-postgresql.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "promcat-postgresql.labels" -}}
helm.sh/chart: {{ include "promcat-postgresql.chart" . }}
{{ include "promcat-postgresql.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "promcat-postgresql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "promcat-postgresql.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create connection string to the instance
*/}}
{{- define "promcat-postgresql.connectionString" -}}
{{- $sslcertroot := .Values.dbInstance.sslRootCertEnabled | ternary "&sslrootcert=/var/lib/postgresql/ssl-root-cert.pem" "" }}
{{- $connectionString :=  printf "%s:%s/%s?sslmode=%s%s" (required "A valid host must be passed in .Values.dbInstance.host" .Values.dbInstance.host) .Values.dbInstance.port .Values.dbInstance.database .Values.dbInstance.sslmode $sslcertroot }}
{{- printf "%s" $connectionString }}
{{- end }}

{{/*
Create name of the exporter deployment
*/}}
{{- define "promcat-postgresql.exporterDeploymentName" -}}
{{- printf "%s-exporter" (include "promcat-postgresql.fullname" .) }}
{{- end }}

{{/*
Create name of the configMap
*/}}
{{- define "promcat-postgresql.configMapName" -}}
{{- printf "%s-configmap" (include "promcat-postgresql.fullname" .) }}
{{- end }}

{{/*
Create name of the secret
*/}}
{{- define "promcat-postgresql.secretName" -}}
{{- printf "%s-secret" (include "promcat-postgresql.fullname" .) }}
{{- end }}

{{/*
Create name of the queries ConfigMap
*/}}
{{- define "promcat-postgresql.queriesName" -}}
{{- printf "%s-queries" (include "promcat-postgresql.fullname" .) }}
{{- end }}