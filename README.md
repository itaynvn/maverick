# maverick
example k8s app that utilizes ELK stack
maverick is just a codename bro dont get mad

## steps
create configmap:
```
kubectl -n mvr apply -f logstash-configmap.yaml
```

patch logstash statefulset to mount the configmap:
```
kubectl -n mvr patch sts logstash-logstash \
--patch-file logstash-patch.yaml
```

patch logstash service:
```
kubectl -n mvr patch svc logstash-logstash-headless --type='json' \
-p='[{"op": "replace", "path": "/spec/ports/0/port", "value":5044}]'
kubectl -n mvr patch svc logstash-logstash-headless --type='json' \
-p='[{"op": "replace", "path": "/spec/ports/0/targetPort", "value":5044}]'
```