# kube-router

After install

```
kubectl -n kube-system delete ds kube-proxy
docker run --privileged -v /lib/modules:/lib/modules --net=host k8s.gcr.io/kube-proxy:v1.17.1 kube-proxy --cleanup
```
