{{/*
Expand the name of the chart.
*/}}
{{- define "common-library.names.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "common-library.names.fullname" -}}
    {{- $name := include "common-library.names.name" . -}}
    {{- if .Values.fullnameOverride -}}
        {{- $name = default .Values.fullnameOverride -}}
    {{- else -}}
        {{- if contains $name .Release.Name -}}
            {{- $name = .Release.Name -}}
    {{- else -}}
      {{- $name = printf "%s-%s" .Release.Name $name -}}
    {{- end -}}
  {{- end -}}
  {{- trunc 63 $name | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "common-library.names.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create the name of the ServiceAccount to use */}}
{{- define "common-library.names.serviceAccountName" -}}
  {{- if .Values.serviceAccount.create -}}
    {{- default (include "common-library.names.fullname" .) .Values.serviceAccount.name -}}
  {{- else -}}
    {{- default "default" .Values.serviceAccount.name -}}
  {{- end -}}
{{- end -}}
