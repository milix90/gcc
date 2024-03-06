FROM golang:1.21.6

WORKDIR /app

COPY graph-processor .

ENV GO111MODULE on
ENV GOPROXY https://goproxy.cn

# RUN go test -v .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main presenter/main.go
RUN chmod +x main

CMD ["/app/main"]