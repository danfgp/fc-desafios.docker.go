FROM golang:1.19.2 AS builder

WORKDIR /go/src/danfgp/hello

COPY go.mod .
COPY main.go .

RUN go build

RUN go install


FROM scratch AS distro

COPY --from=builder /go/bin/hello /

CMD ["/hello"] 
