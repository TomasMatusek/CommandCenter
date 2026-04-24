# Main service

# Docker commands

Build docker image
```bash
CommandCenter\apps\backend\main> docker build -t command-center-main-service:latest .
```

# Kubernetes command

Deploy to kubernetes
```bash
CommandCenter> kubectl create namespace command-center
CommandCenter> kubectl apply -f deploy/base/app-server/
CommandCenter> kubectl get pods -n command-center
CommandCenter> curl http://localhost:30080/api/health
```

Detail about pod
```bash
CommandCenter> kubectl describe pod -n command-center -l app=command-center-main-service
```

Applying changes
```bash
// Fixed image, same YAML
CommandCenter> kubectl rollout restart deployment command-center-main-service -n command-center

// Changed YAML (ports, env vars, replicas)
// Changed image tag (e.g. :v2)
CommandCenter> kubectl apply -f

// Everything broken, start from scratch 
CommandCenter> kubectl delete -f
CommandCenter> kubectl apply -f
```

Get Pods:
```bash
CommandCenter> kubectl get pods -n command-center
NAME                                         READY   STATUS    RESTARTS   AGE
command-center-main-service-cc7948fd-5gb49   1/1     Running   0          3m45s
command-center-main-service-cc7948fd-7w579   1/1     Running   0          3m38s
command-center-main-service-cc7948fd-7w579   1/1     Running   0          4m
```

Get services:
```bash
CommandCenter> kubectl get svc -n command-center
NAME                          TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
command-center-main-service   NodePort   10.96.244.179   <none>        8080:30080/TCP   9m9s
```

Check deployment yaml:
```bash
kubectl get deployment -n command-center -o yaml
```

## Kubectl Resource Shorthands

| Short | Full Name            | What It Is                          |
|-------|----------------------|-------------------------------------|
| `svc` | Service              | Network endpoint to reach your pods |
| `po`  | Pod                  | Running container(s)                |
| `deploy` | Deployment        | Manages pod replicas                |
| `ns`  | Namespace            | Virtual cluster                     |
| `cm`  | ConfigMap            | Configuration key-values            |
| `ing` | Ingress              | External HTTP routing               |
| `pv`  | PersistentVolume     | Storage                             |
| `pvc` | PersistentVolumeClaim| Storage request                     |
| `rs`  | ReplicaSet           | Ensures X pods are running          |
| `no`  | Node                 | Machine in the cluster              |
| `sa`  | ServiceAccount       | Identity for pods                   |
| `ep`  | Endpoints            | IP+port pairs behind a Service      |
| `ds`  | DaemonSet            | One pod per node                    |
| `sts` | StatefulSet          | Ordered, stable pod management      |
| `cj`  | CronJob              | Scheduled jobs                      |
| `hpa` | HorizontalPodAutoscaler | Auto-scale pods by metrics       |

> **Tip:** Run `kubectl api-resources` to see all available shorthands in your cluster.
