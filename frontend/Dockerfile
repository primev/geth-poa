FROM alpine:latest

RUN apk add --no-cache git yarn

RUN git clone https://github.com/primevprotocol/hyperlane-ui.git
WORKDIR /hyperlane-ui
RUN git checkout 64d6f69634077b02acc33777a099da8de8a349a0

RUN yarn

ARG NEXT_PUBLIC_WALLET_CONNECT_ID

RUN yarn build

CMD [ "yarn", "dev" ]
