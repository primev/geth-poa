FROM alpine:latest

RUN apk add --no-cache git yarn

RUN git clone https://github.com/primevprotocol/hyperlane-ui.git
WORKDIR /hyperlane-ui
RUN git checkout cbc3a97bedcc1503ec2aa61b9bca0fe0bb0bc64d

RUN yarn

ARG NEXT_PUBLIC_WALLET_CONNECT_ID

RUN yarn build

CMD [ "yarn", "dev" ]
