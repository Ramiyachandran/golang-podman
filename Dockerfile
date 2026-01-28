#stage 1:Build  the go app
FROM golang :1.25.6-alpine 3.23

WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o main main.go

#stage 2:Run the app
FROM alpine:3.23

WORKDIR /root/
COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"]