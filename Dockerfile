FROM alpine:edge

RUN apk add --no-cache ca-certificates tzdata
WORKDIR /proxypool-src
COPY ./assets /proxypool-src/assets
COPY ./config /proxypool-src/config
COPY ./proxypool /proxypool-src/
ENTRYPOINT ["/proxypool-src/proxypool", "-d"]
