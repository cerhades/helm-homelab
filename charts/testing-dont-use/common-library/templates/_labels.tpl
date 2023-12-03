{{/* Common labels shared across objects */}}
{{- define "common-library.labels" -}}
helm.sh/chart: {{ include "common-library.names.chart" . }}
{{ include "common-library.labels.selectorLabels" . }}
  {{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
  {{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Selector labels shared across objects */}}
{{- define "common-library.labels.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common-library.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
