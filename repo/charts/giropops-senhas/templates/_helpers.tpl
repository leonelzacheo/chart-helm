{{/*
CRIAR AS NOSSAS TAGS
*/}}

{{- define "app.labels" -}}
app: {{ .labels.app | quote }}
env: {{ .labels.env | quote }}
live: {{ .labels.live | quote }}
{{- end }}


{{/*
DEFINIR OS LIMITES DE RECURSOS
*/}}
{{- define "app.resources" -}}
requests:
  memory: {{ .resources.requests.memory }}
  cpu: {{ .resources.requests.cpu }}
limits:
  memory: {{ .resources.limits.memory }}
  cpu: {{ .resources.limits.cpu }}
{{- end }}


{{/*
DEFINIÇÃO DE PORTAS DOS CONTAINERS
*/}}

{{- define "app.ports" -}}
{{ range .ports }}
- containerPort: {{ .port }}
{{- end }}
{{- end }}


{{/*
DEFININDO OS NOSSOS CONFIGMAPS
*/}}

{{- define "database.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .component }}-db-config
data:
  app-config.yaml: |
    {{- toYaml .config | nindent 4 }}
{{- end }}

{{/*
DEFININDO OBSERVABILIDADE
*/}}

{{- define "observability.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .component }}-boservability-config
data:
  app-config.json: |
    {{ toJson .config }}
{{- end }}

