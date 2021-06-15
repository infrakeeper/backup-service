# BUILD CONTAINER
FROM quay.io/bitnami/golang:1.15 AS builder

WORKDIR $GOPATH/src/github.com/infrakeeper/bar-service
COPY . .

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/bar-service

# RUN CONTAINER
FROM scratch

COPY --from=builder /go/bin/bar-service /go/bin/bar-service

ENTRYPOINT ["/go/bin/bar-service"]