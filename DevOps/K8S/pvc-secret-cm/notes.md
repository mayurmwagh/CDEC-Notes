# Kubernetes ConfigMap, Secret, StatefulSet, and PersistentVolumeClaim (PVC) Notes

# 1. ConfigMap in Kubernetes

A ConfigMap in Kubernetes is used to store non-sensitive configuration data separately from application code.

## Uses of ConfigMap

* Environment variables
* Application configuration
* Configuration files
* Port numbers
* URLs

---

# Create ConfigMap

## Using YAML

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  APP_MODE: "production"
  APP_PORT: "8080"
```

Apply:

```bash
kubectl apply -f configmap.yaml
```

---

## Using Command Line

```bash
kubectl create configmap app-config \
  --from-literal=APP_MODE=production \
  --from-literal=APP_PORT=8080
```

---

# Use ConfigMap in Pod

## As Environment Variable

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: myapp
spec:
  containers:
  - name: app
    image: nginx
    env:
    - name: APP_MODE
      valueFrom:
        configMapKeyRef:
          name: app-config
          key: APP_MODE
```

---

# Check ConfigMap Value Inside Pod

## Enter Pod

```bash
kubectl exec -it <pod-name> -- /bin/bash
```

OR

```bash
kubectl exec -it <pod-name> -- /bin/sh
```

---

## Check Environment Variable

```bash
echo $APP_MODE
```

OR

```bash
env | grep APP_MODE
```

---

# Mount ConfigMap as Volume

```yaml
volumes:
- name: config-volume
  configMap:
    name: app-config
```

```yaml
volumeMounts:
- name: config-volume
  mountPath: /etc/config
```

Check mounted files:

```bash
kubectl exec -it <pod-name> -- ls /etc/config
```

Read value:

```bash
kubectl exec -it <pod-name> -- cat /etc/config/APP_MODE
```

---

# Important Commands

```bash
kubectl get configmap
kubectl describe configmap app-config
kubectl get cm
```

---

# 2. Secret in Kubernetes

Secrets are used to store sensitive data securely.

## Examples

* Passwords
* Tokens
* API Keys
* Database Credentials

---

# Create Secret

## Using Command Line

```bash
kubectl create secret generic db-secret \
  --from-literal=username=admin \
  --from-literal=password=Admin@123
```

---

# Create Secret Using YAML

## Encode Values

```bash
echo -n 'admin' | base64
echo -n 'Admin@123' | base64
```

---

## Secret YAML

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
type: Opaque
data:
  username: YWRtaW4=
  password: QWRtaW5AMTIz
```

Apply:

```bash
kubectl apply -f secret.yaml
```

---

# Use Secret in Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secret-pod
spec:
  containers:
  - name: nginx
    image: nginx
    env:
    - name: DB_USERNAME
      valueFrom:
        secretKeyRef:
          name: db-secret
          key: username

    - name: DB_PASSWORD
      valueFrom:
        secretKeyRef:
          name: db-secret
          key: password
```

---

# Verify Secret Inside Pod

```bash
kubectl exec -it secret-pod -- /bin/bash
```

Check values:

```bash
echo $DB_USERNAME
echo $DB_PASSWORD
```

---

# Important Secret Commands

```bash
kubectl get secrets
kubectl describe secret db-secret
kubectl get secret db-secret -o yaml
```

---

# ConfigMap vs Secret

| Feature  | ConfigMap          | Secret         |
| -------- | ------------------ | -------------- |
| Stores   | Non-sensitive data | Sensitive data |
| Encoding | Plain Text         | Base64         |

---

# 3. StatefulSet in Kubernetes

StatefulSet is used to manage stateful applications.

## Examples

* MySQL
* MongoDB
* Kafka
* PostgreSQL

---

# Why StatefulSet?

Stateful applications require:

* Stable Pod names
* Persistent storage
* Ordered deployment
* Stable network identity

---

# Deployment vs StatefulSet

| Feature   | Deployment | StatefulSet |
| --------- | ---------- | ----------- |
| Pod Names | Random     | Fixed       |
| Storage   | Temporary  | Persistent  |
| Identity  | Dynamic    | Stable      |

---

# Headless Service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  clusterIP: None
  selector:
    app: nginx
  ports:
  - port: 80
```

---

# StatefulSet Example

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: nginx-statefulset
spec:
  serviceName: nginx-service
  replicas: 3

  selector:
    matchLabels:
      app: nginx

  template:
    metadata:
      labels:
        app: nginx

    spec:
      containers:
      - name: nginx
        image: nginx

        volumeMounts:
        - name: nginx-storage
          mountPath: /usr/share/nginx/html

  volumeClaimTemplates:
  - metadata:
      name: nginx-storage

    spec:
      accessModes:
      - ReadWriteOnce

      resources:
        requests:
          storage: 1Gi
```

Apply:

```bash
kubectl apply -f statefulset.yaml
```

---

# Check StatefulSet

```bash
kubectl get sts
kubectl describe sts nginx-statefulset
```

---

# StatefulSet Pod Naming

```bash
nginx-statefulset-0
nginx-statefulset-1
nginx-statefulset-2
```

---

# Scale StatefulSet

```bash
kubectl scale sts nginx-statefulset --replicas=5
```

---

# 4. PersistentVolumeClaim (PVC)

PVC is used to request persistent storage for Pods.

---

# Storage Flow

```text
Pod → PVC → PV → Physical Storage
```

---

# Create PersistentVolume (PV)

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv

spec:
  capacity:
    storage: 1Gi

  accessModes:
  - ReadWriteOnce

  hostPath:
    path: /data
```

Apply:

```bash
kubectl apply -f pv.yaml
```

---

# Create PersistentVolumeClaim (PVC)

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc

spec:
  accessModes:
  - ReadWriteOnce

  resources:
    requests:
      storage: 500Mi
```

Apply:

```bash
kubectl apply -f pvc.yaml
```

---

# Check PV and PVC

```bash
kubectl get pv
kubectl get pvc
```

---

# Use PVC in Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod

spec:
  containers:
  - name: nginx
    image: nginx

    volumeMounts:
    - mountPath: "/usr/share/nginx/html"
      name: my-storage

  volumes:
  - name: my-storage
    persistentVolumeClaim:
      claimName: my-pvc
```

---

# Verify PVC Inside Pod

```bash
kubectl exec -it nginx-pod -- /bin/bash
```

Create file:

```bash
echo "Hello PVC" > /usr/share/nginx/html/test.txt
```

---

# Access Modes

| Mode          | Meaning                   |
| ------------- | ------------------------- |
| ReadWriteOnce | One node can read/write   |
| ReadOnlyMany  | Multiple nodes read only  |
| ReadWriteMany | Multiple nodes read/write |

---

# Important Commands

```bash
kubectl get pv
kubectl get pvc
kubectl describe pvc my-pvc
kubectl delete pvc my-pvc
```

---

# PV vs PVC

| PV               | PVC                |
| ---------------- | ------------------ |
| Actual storage   | Storage request    |
| Cluster resource | Namespace resource |

---
