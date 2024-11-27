{{/*
Expand the name of the chart.
*/}}
{{- define "sveltos-dashboard.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sveltos-dashboard.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sveltos-dashboard.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sveltos-dashboard.labels" -}}
helm.sh/chart: {{ include "sveltos-dashboard.chart" . }}
{{ include "sveltos-dashboard.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sveltos-dashboard.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sveltos-dashboard.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Backend Manager specific labels
*/}}
{{- define "sveltos-dashboard.backendManagerLabels" -}}
{{- include "sveltos-dashboard.labels" . }}
app.kubernetes.io/component: backendManager
{{- end }}

{{/*
Dashboard specific labels
*/}}
{{- define "sveltos-dashboard.dashboardLabels" -}}
{{- include "sveltos-dashboard.labels" . }}
app.kubernetes.io/component: dashboard
{{- end }}

{{/*
Backend Manager Service Account Name
*/}}
{{- define "sveltos-dashboard.backendManagerServiceAccountName" -}}
{{- if .Values.backendManager.serviceAccount.create }}
{{ default (include "sveltos-dashboard.fullname" .) .Values.backendManager.serviceAccount.name }}
{{- else }}
{{ default .Values.backendManager.serviceAccount.name "default" }}
{{- end }}
{{- end }}

{{/*
Dashboard Service Account Name
*/}}
{{- define "sveltos-dashboard.dashboardServiceAccountName" -}}
{{- if .Values.dashboard.serviceAccount.create }}
{{ default (include "sveltos-dashboard.fullname" .) .Values.dashboard.serviceAccount.name }}
{{- else }}
{{ default .Values.dashboard.serviceAccount.name "default" }}
{{- end }}
{{- end }}