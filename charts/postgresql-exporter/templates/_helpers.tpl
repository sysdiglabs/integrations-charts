{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "postgresql-exporter.name" -}}
{{- (printf "%s-%s-%s" (default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-") .Values.namespaceName .Values.workloadName) | trunc 63 }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name. Trunc to 55 (63 - "-deploy").
*/}}
{{- define "postgresql-exporter.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 55 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Chart.Name .Values.namespaceName .Values.workloadName | trunc 55 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "postgresql-exporter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "postgresql-exporter.labels" -}}
helm.sh/chart: {{ include "postgresql-exporter.chart" . }}
{{ include "postgresql-exporter.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "postgresql-exporter.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postgresql-exporter.name" . }}
{{- end }}

{{/*
Annotations
*/}}
{{- define "postgresql-exporter.sysdigAnnotations" -}}
promcat.sysdig.com/port: "9187"
promcat.sysdig.com/target_ns: {{ required "A valid namespace for the application must be passed in .Values.namespaceName" .Values.namespaceName | quote }}
promcat.sysdig.com/target_workload_type: {{ required "A valid workload type for the application must be passed in .Values.workloadType" .Values.workloadType | quote }}
promcat.sysdig.com/target_workload_name: {{ required "A valid workload name for the application must be passed in .Values.workloadName" .Values.workloadName | quote }}
promcat.sysdig.com/integration_type: {{ required "A valid integration type name for the application must be passed in .Values.integrationType" .Values.integrationType | quote }}
{{- end }}

{{/*
Create connection string to the instance
*/}}
{{- define "postgresql-exporter.connectionString" -}}
{{- $sslcertroot := .Values.dbInstance.sslRootCertEnabled | ternary "&sslrootcert=/var/lib/postgresql/ssl-root-cert.pem" "" }}
{{- $connectionString :=  printf "%s:%s/%s?sslmode=%s%s" (required "A valid host must be passed in .Values.dbInstance.host" .Values.dbInstance.host) .Values.dbInstance.port .Values.dbInstance.database .Values.dbInstance.sslmode $sslcertroot }}
{{- printf "%s" $connectionString }}
{{- end }}

{{/*
Create name of the exporter deployment
*/}}
{{- define "postgresql-exporter.exporterDeploymentName" -}}
{{- printf "%s-deploy" (include "postgresql-exporter.fullname" .) }}
{{- end }}

{{/*
Create name of the queries ConfigMap
*/}}
{{- define "postgresql-exporter.queriesName" -}}
{{- printf "%s-queries" (include "postgresql-exporter.fullname" .) }}
{{- end }}