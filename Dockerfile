FROM golang:1.21-alpine AS builder

RUN apk add --no-cache gcc musl-dev linux-headers git make

RUN git clone https://github.com/primevprotocol/go-ethereum.git /go-ethereum
WORKDIR /go-ethereum

# commit: https://github.com/primevprotocol/go-ethereum/commit/3dd54b5e4aacf81f655fd242430803b43119ddad
RUN git checkout 3dd54b5e4aacf81f655fd242430803b43119ddad
RUN make geth

FROM alpine:latest

RUN apk add --no-cache jq

COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/

COPY genesis.json /genesis.json

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8545

ENTRYPOINT ["/entrypoint.sh"] 
