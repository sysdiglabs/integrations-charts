{{/*
Annotations
*/}}
{{- define "php-fpm-exporter.sysdigAnnotations" -}}
promcat.sysdig.com/port: {{ required "A valid port number for the exporter must be passed in .Values.env.web.listen_address" .Values.env.web.listen_address | quote }}
promcat.sysdig.com/integration_type: {{ required "A valid integration type name for the application must be passed in .Values.integrationType" .Values.integrationType | quote }}
{{- end }}
{{- define "php-fpm-exporter.prometheusAnnotations" -}}
prometheus.io/scrape: "true"
prometheus.io/port: "{{ .Values.env.web.listen_address }}"
{{- end }}