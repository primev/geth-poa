# FROM golang:1.21-alpine AS builder
FROM golang:1.21-alpine 

RUN apk add --no-cache gcc musl-dev linux-headers git make

# RUN git clone https://github.com/shaspitz/go-ethereum.git /go-ethereum
# WORKDIR /go-ethereum
# # commit: logs + handle delay being shorter than period 
# RUN git checkout 01664986e2fcb9463a7911c8a963005c5da9e43f

# # RUN make all
# RUN make geth

# FROM alpine:latest

RUN apk add --no-cache jq

# COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/
# COPY --from=builder /go-ethereum/build/bin/bootnode /usr/local/bin/

COPY genesis.json /genesis.json

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"] 
