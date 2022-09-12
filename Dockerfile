FROM alpine:3.15

RUN apk add --no-cache git go

ARG GIT_TAG=v0.5.0

RUN cd ~ &&\
    git clone -b $GIT_TAG --depth 1 https://github.com/suprememoocow/victron-exporter.git src &&\
    cd ~/src &&\
    go env -w GOPROXY=direct &&\
    go build &&\
    mv victron-exporter /opt &&\
    apk --purge del git go

ENTRYPOINT ["/opt/victron-exporter"]

