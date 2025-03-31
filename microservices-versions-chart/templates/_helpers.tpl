{{- define "microservices.versions" -}}
{{- range .Values.microservices -}}
{{ .name }}: {{ .version }}
{{- end -}}
{{- end -}}