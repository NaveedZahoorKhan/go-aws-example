FROM golang:latest as BUILD

WORKDIR /app

COPY go.mod .
COPY go.sum .
COPY main.go .

RUN go build -o mygoservice main.go

FROM ubuntu:20.04
WORKDIR /app
COPY --from=build /app/mygoservice .
ENTRYPOINT [ "./mygoservice" ]
