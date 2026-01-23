#stage 1:Build  the go app
FROM golang :1.23-alpine AS builder 

WORKDIR /app
COPY . .
RUN go build -o main main.go

#stage 2:Run the app
FROM alpine:latest 

WORKDIR /root/
COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"]