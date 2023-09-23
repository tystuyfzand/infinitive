FROM golang:alpine AS builder

RUN mkdir /app
WORKDIR /app

ADD . /app
RUN go build -o infinitive

FROM alpine

COPY --from=builder /app/infinitive /usr/bin/infinitive

CMD [ "/usr/bin/infinitive" ]