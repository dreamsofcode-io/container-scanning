LABEL org.opencontainers.image.source=https://github.com/dreamsofcode-io/container-scanning
LABEL org.opencontainers.image.description="Docker scanning container image"
LABEL org.opencontainers.image.licenses=MIT

FROM golang:1.20.3-alpine as builder

RUN mkdir /app

WORKDIR /app

COPY go.mod .

COPY go.sum .

RUN go mod download

COPY . .

RUN go build -o main .

EXPOSE 8080

CMD ["./main"]
