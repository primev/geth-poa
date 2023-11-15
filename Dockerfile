FROM golang:1.21-alpine AS builder

RUN apk add --no-cache gcc musl-dev linux-headers git make

RUN git clone https://github.com/primevprotocol/go-ethereum.git /go-ethereum
WORKDIR /go-ethereum

# commit: https://github.com/primevprotocol/go-ethereum/commit/f481d9ca0fb8aadcc31dec32389a301c24569a1d
RUN git checkout f481d9ca0fb8aadcc31dec32389a301c24569a1d
RUN make geth

FROM alpine:latest

RUN apk add --no-cache jq

COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/

COPY genesis.json /genesis.json

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8545

ENTRYPOINT ["/entrypoint.sh"] 
