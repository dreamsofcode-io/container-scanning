FROM golang:1.20.3-alpine as builder

RUN mkdir /app

WORKDIR /app

COPY go.mod .

COPY go.sum .

RUN go mod download

COPY . .

RUN go build -o main .

FROM golang:1.20.3-alpine

RUN mkdir /app

WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"]
