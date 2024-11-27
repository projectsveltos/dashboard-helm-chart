# sveltos-dashboard

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.42.0](https://img.shields.io/badge/AppVersion-v0.42.0-informational?style=flat-square)

A Helm chart for Sveltos dashboard

[Sveltos](https://github.com/projectsveltos) is a Kubernetes add-on controller that simplifies the deployment and management of Kubernetes add-ons and applications across multiple clusters whether on-prem, in the cloud or a multitenant environment.

Sveltos runs in a management cluster. It assists users in programmatically deploying and managing Kubernetes add-ons and applications to any cluster in the fleet, including the management cluster.

This repo contains dashboard helm chart. This is a temporary repo. Goal is to have dashboard part of the Sveltos helm chart

# Installing

```command
git clone https://github.com/projectsveltos/dashboard-helm-chart
cd dashboard-helm-chart
helm -n projectsveltos install dashboard .
```

# Access the dashboard
To access the dashboard, you'll need to expose the dashboard service in the projectsveltos namespace.
Currently, it's configured as a ClusterIP service, which limits access to within the cluster.
To expose it externally, you can either change the service type to LoadBalancer or utilize an Ingress/Gateway API.

Refer to the Sveltos' [documentation](https://projectsveltos.github.io/sveltos/getting_started/install/dashboard/) for more information.

# Customize the installation

There are two methods for specifying overrides of values during Chart installation: `--values` and `--set`.

The `--values` option is the preferred method because it allows you to keep your overrides in a YAML file, rather than specifying them all on the command line.
Create a copy of the YAML file `values.yaml` and add your overrides to it.

Specify your overrides file when you install the Chart:

        helm -n projectsveltos upgrade dashboard . --install --values myvalues.yaml

The values in your overrides file `myvalues.yaml` will override their counterparts in the Chart's values.yaml file.
Any values in `values.yaml` that weren't overridden will keep their defaults.

If you only need to make minor customizations, you can specify them on the command line by using the `--set` option. For example:

        helm -n projectsveltos upgrade dashboard . --install --set dashboard.ingress.enabled=true

Here the values you can override:

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backendManager.affinity | object | `{}` |  |
| backendManager.image.pullPolicy | string | `"IfNotPresent"` |  |
| backendManager.image.repository | string | `"projectsveltos/ui-backend"` |  |
| backendManager.image.tag | string | `"main"` |  |
| backendManager.livenessProbe.failureThreshold | int | `3` |  |
| backendManager.livenessProbe.httpGet.path | string | `"/healthz"` |  |
| backendManager.livenessProbe.httpGet.port | string | `"healthz"` |  |
| backendManager.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| backendManager.livenessProbe.initialDelaySeconds | int | `15` |  |
| backendManager.livenessProbe.periodSeconds | int | `20` |  |
| backendManager.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| backendManager.podSecurityContext.runAsNonRoot | bool | `true` |  |
| backendManager.readinessProbe.failureThreshold | int | `3` |  |
| backendManager.readinessProbe.httpGet.path | string | `"/readyz"` |  |
| backendManager.readinessProbe.httpGet.port | string | `"healthz"` |  |
| backendManager.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| backendManager.readinessProbe.initialDelaySeconds | int | `5` |  |
| backendManager.readinessProbe.periodSeconds | int | `10` |  |
| backendManager.replicaCount | int | `1` |  |
| backendManager.resources.limits.cpu | string | `"500m"` |  |
| backendManager.resources.limits.memory | string | `"128Mi"` |  |
| backendManager.resources.requests.cpu | string | `"10m"` |  |
| backendManager.resources.requests.memory | string | `"64Mi"` |  |
| backendManager.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| backendManager.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| backendManager.service.name | string | `"ui-backend-manager"` |  |
| backendManager.service.port | int | `80` |  |
| backendManager.service.targetPort | int | `8080` |  |
| backendManager.service.type | string | `"ClusterIP"` |  |
| backendManager.serviceAccountName | string | `"backend-manager"` |  |
| backendManager.terminationGracePeriodSeconds | int | `10` |  |
| backendManager.tolerations | list | `[]` |  |
| dashboard.affinity | object | `{}` |  |
| dashboard.image.pullPolicy | string | `"IfNotPresent"` |  |
| dashboard.image.repository | string | `"docker.io/projectsveltos/dashboard"` |  |
| dashboard.image.tag | string | `""` |  |
| dashboard.ingress.annotations | list | `[]` |  |
| dashboard.ingress.className | string | `""` |  |
| dashboard.ingress.enabled | bool | `false` |  |
| dashboard.ingress.hosts[0].host | string | `"sveltos.local"` |  |
| dashboard.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| dashboard.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| dashboard.ingress.tls | list | `[]` |  |
| dashboard.livenessProbe.failureThreshold | int | `3` |  |
| dashboard.livenessProbe.httpGet.path | string | `"/"` |  |
| dashboard.livenessProbe.httpGet.port | string | `"http"` |  |
| dashboard.livenessProbe.initialDelaySeconds | int | `15` |  |
| dashboard.livenessProbe.periodSeconds | int | `20` |  |
| dashboard.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| dashboard.podSecurityContext | object | `{}` |  |
| dashboard.readinessProbe.failureThreshold | int | `3` |  |
| dashboard.readinessProbe.httpGet.path | string | `"/"` |  |
| dashboard.readinessProbe.httpGet.port | string | `"http"` |  |
| dashboard.readinessProbe.initialDelaySeconds | int | `5` |  |
| dashboard.readinessProbe.periodSeconds | int | `10` |  |
| dashboard.replicaCount | int | `1` |  |
| dashboard.resources | object | `{}` |  |
| dashboard.securityContext | object | `{}` |  |
| dashboard.service.port | int | `80` |  |
| dashboard.service.targetPort | int | `5173` |  |
| dashboard.service.type | string | `"ClusterIP"` |  |
| dashboard.terminationGracePeriodSeconds | int | `10` |  |
| dashboard.tolerations | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |

