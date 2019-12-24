# Monitoring

```
kubectl create ns monitoring
```

## etcd

Run on any master node:
```
D="$(mktemp -d)"
cp /etc/kubernetes/pki/etcd/{ca.crt,healthcheck-client.{crt,key}} $D
kubectl -n monitoring create secret generic etcd-client --from-file="$D"
rm -fr "$D"
```
â
