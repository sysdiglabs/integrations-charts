{{- define "jmx-exporter.bundledIntegrations" -}}
kafka,cassandra
{{- end -}}

{{- define "jmx-exporter.isBundledIntegration" -}}
    {{- if not .Values.integrationType -}}
        {{- fail (cat "The Values.integrationType is not one of the following:" (cat (include "jmx-exporter.bundledIntegrations" . ) ",custom" | nospace ) ) -}}
    {{- end -}}
    {{- if contains .Values.integrationType (include "jmx-exporter.bundledIntegrations" . ) -}}
        "true"
    {{- else if contains .Values.integrationType "custom" -}}
        "false"
    {{- else -}}
        {{- fail (cat "The Values.integrationType is not one of the following:" (cat (include "jmx-exporter.bundledIntegrations" . ) ",custom" | nospace ) ) -}}
    {{- end }}
{{- end }}

{{- define "jmx-exporter.finalIntegrationName" -}}
{{- if contains "true" ( include "jmx-exporter.isBundledIntegration" . ) -}}
    {{- required "A valid integration type name for the application must be passed in .Values.integrationType" .Values.integrationType -}}
{{- else -}}
    {{- required "A valid integration custom name for the application must be passed in .Values.customIntegrationTypeName" .Values.customIntegrationTypeName -}}
{{- end }}
{{- end }}

{{- define "jmx-exporter.finalConfigmapName" -}}
    {{- if .Values.customJMXConfigMapName -}}
        {{- .Values.customJMXConfigMapName -}}
    {{- else -}}
        jmx-config
    {{- end }}
{{- end }}


{{/*
Annotations
*/}}
{{- define "jmx-exporter.sysdigAnnotations" -}}
promcat.sysdig.com/port: {{ required "A valid port number for the exporter must be passed in .Values.port" .Values.port | quote }}
promcat.sysdig.com/integration_type: {{ include "jmx-exporter.finalIntegrationName" . | quote}}
{{- end }}