# Victron Exporter Dockerfile

This is just a dockerfile for building victron exporter put together by suprememoocow.

Source is at: https://github.com/suprememoocow/victron-exporter

Compiled image is at https://hub.docker.com/r/theempty/victron-exporter


## Example Kubes

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: victron-exporter
spec:
  selector:
    matchLabels:
      app: victron-exporter
  template:
    metadata:
      labels:
        app: victron-exporter
    spec:
      containers:
      - name: victron-exporter
        image: theempty/victron-exporter
        resources: {}
        ports:
          - containerPort: 9226
        args:
          - -mqtt.host
          - 192.168.50.5
```

