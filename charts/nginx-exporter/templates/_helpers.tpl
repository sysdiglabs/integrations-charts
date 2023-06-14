{{/*
Annotations
*/}}
{{- define "nginx-exporter.sysdigAnnotations" -}}
promcat.sysdig.com/port: "{{ .Values.port }}"
promcat.sysdig.com/integration_type: {{ required "A valid integration type name for the application must be passed in .Values.integrationType" .Values.integrationType | quote }}
{{- end }}
{{- define "nginx-exporter.prometheusAnnotations" -}}
prometheus.io/scrape: "true"
prometheus.io/port: "{{ .Values.port }}"
{{- end }}