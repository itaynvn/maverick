# maverick
example k8s app that utilizes ELK stack
maverick is just a codename bro dont get mad

## steps
run to create configmap:
```
kubectl -n mvr create configmap logstash-config --from-file=logstash.conf --from-file=logstash.yml
```

add configmap to logstash deploy:
```
spec:
      containers:
        volumeMounts:
        - name: config-volume
          mountPath: /usr/share/logstash/config
      volumes:
      - name: config-volume
        configMap:
          name: logstash-config
```