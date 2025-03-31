{{- define "myapp.name" -}}
{{ .Chart.Name }}-{{ .Release.Name }}
{{- end -}}

{{- define "myapp.fullname" -}}
{{- printf "%s-%s" (include "myapp.name" .) .Values.service.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "myapp.labels" -}}
app: {{ include "myapp.fullname" . }}
chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
{{- end -}}