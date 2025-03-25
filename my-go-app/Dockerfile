FROM golang:1.20 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY src/ ./src/

RUN go build -o my-go-app ./src/main.go

FROM gcr.io/distroless/base

COPY --from=builder /app/my-go-app /my-go-app

CMD ["/my-go-app"]