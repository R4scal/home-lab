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

## snmp-exporter

```
kubectl create configmap --namespace=monitoring snmp-exporter-config --from-file=snmp.yml --dry-run -o yaml | \
  kubectl replace configmap --namespace=monitoring snmp-exporter-config -f -  
```
