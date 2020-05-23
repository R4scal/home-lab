# cert-manager

Install cert-manager

```
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.15.0/cert-manager.yaml
```

Use Letsencrypt with Cloudflare

```
API_KEY=$(echo -n secret_api_key | base64 -)
cat <<EOF | kubectl apply -f -
---
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-api-key
  namespace: cert-manager
type: Opaque
data:
  api-key: ${API_KEY}
EOF
```

```
EMAIL_ADDRESS="user@example.com"
cat <<EOF | kubectl apply -f -
---
apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
  name: letsencrypt
  namespace: cert-manager
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: ${EMAIL_ADDRESS}
    privateKeySecretRef:
      name: letsencrypt
    solvers:
    - dns01:
        cloudflare:
          email: ${EMAIL_ADDRESS}
          apiTokenSecretRef:
            name: cloudflare-api-key
            key: api-key
EOF
```
