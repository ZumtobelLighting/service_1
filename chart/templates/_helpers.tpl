{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ports.service" }}
{{- range $key, $value := .Values.ports }}
- port: {{ $v := $value | toString | splitList ":" }}{{$v | first}}
  name: {{ $key }}
  targetPort: {{ $v := $value | toString | splitList ":" }}{{$v | last}}
{{- end }}
{{- end }}

{{- define "ports.pod" }}
{{- range $key, $value := .Values.ports }}
  - containerPort: {{ $v := $value | toString | splitList ":" }}{{$v | last}}
    name: {{ $key }}
{{- end }}
{{- end }}

{{/*
Add regular env variables and create secrets from values
*/}}
{{- define "env.secrets"}}
{{- $appName := include "app.name" . -}}
{{- range $key, $val := .Values.env.secret }}
  - name: {{ $key }}
    valueFrom:
      secretKeyRef:
        name: {{ $appName }}
        key: {{ $key }}
{{- end}}
{{- range $key, $value := .Values.env.regular }}
  - name: "{{ $key }}"
    value: "{{ $value }}"
{{- end}}
{{- end }}
