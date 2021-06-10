FROM golang:alpine as builder

RUN apk add --no-cache make git
WORKDIR /proxypool-src
COPY . /proxypool-src
RUN mv ./proxypoolv0.7.3 /proxypool

FROM alpine:latest

RUN apk add --no-cache ca-certificates tzdata
WORKDIR /proxypool-src
COPY ./assets /proxypool-src/assets
COPY ./config /proxypool-src/config
COPY --from=builder /proxypool /proxypool-src/
ENTRYPOINT ["/proxypool-src/proxypool", "-d"]
