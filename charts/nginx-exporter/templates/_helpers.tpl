{{/*
Annotations
*/}}
{{- define "nginx-exporter.sysdigAnnotations" -}}
promcat.sysdig.com/port: "9113"
promcat.sysdig.com/integration_type: {{ required "A valid integration type name for the application must be passed in .Values.integrationType" .Values.integrationType | quote }}
{{- end }}