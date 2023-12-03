{{/* Determine the Pod annotations used in the controller */}}
{{- define "common-library.podAnnotations" -}}
  {{- if .Values.podAnnotations -}}
    {{- tpl (toYaml .Values.podAnnotations) . | nindent 0 -}}
  {{- end -}}

  {{- $configMapsFound := false -}}
  {{- range $name, $configmap := .Values.configmap -}}
    {{- if $configmap.enabled -}}
      {{- $configMapsFound = true -}}
    {{- end -}}
  {{- end -}}
  {{- if $configMapsFound -}}
    {{- printf "checksum/config: %v" (include ("common-library.configmap") . | sha256sum) | nindent 0 -}}
  {{- end -}}
{{- end -}}