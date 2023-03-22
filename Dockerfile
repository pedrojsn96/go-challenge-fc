FROM golang:alpine as builder

WORKDIR /go/src/app

COPY app .

RUN go build -o /app hello.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]