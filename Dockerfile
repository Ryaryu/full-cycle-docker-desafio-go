FROM golang:alpine as base

WORKDIR /app/user

COPY code/ .
RUN CGO_ENABLED=0 go install -ldflags="-s -w" -tags timetzdata

FROM scratch
COPY --from=base /go/bin/full-cycle-docker-desafio-go /run-me

ENTRYPOINT ["/run-me"]
