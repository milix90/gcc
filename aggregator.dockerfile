FROM golang:1.21.6

WORKDIR /app

COPY graph-aggregator .

ENV CGO_ENABLED 1
ENV GO111MODULE on
ENV GOPROXY https://goproxy.cn

# RUN go test -v .

RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o main presenter/main.go
RUN chmod +x main

CMD ["/app/main"]