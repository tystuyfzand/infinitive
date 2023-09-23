FROM golang:alpine AS builder

ADD . .
RUN go build -o infinitive

FROM alpine

COPY --from=builder infinitive /usr/bin/infinitive

CMD [ "/usr/bin/infinitive" ]