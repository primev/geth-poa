FROM alpine:latest

RUN apk update && apk add --no-cache git yarn

WORKDIR /
RUN git clone https://github.com/hyperlane-xyz/hyperlane-monorepo.git
WORKDIR /hyperlane-monorepo
RUN git checkout v1.5.8
RUN yarn install
RUN yarn build

RUN ln -s /hyperlane-monorepo/typescript/cli/dist/cli.js /usr/local/bin/hyperlane
RUN chmod +x /usr/local/bin/hyperlane

# Overwrite chains.ts 
COPY chains.ts config/chains.ts

# Overwrtie multisig_ism.ts
COPY multisig_ism.ts config/multisig_ism.ts

# Overwrite start_blocks.ts
COPY start_blocks.ts config/start_blocks.ts

# Overwrite warp_tokens.ts
COPY warp_tokens.ts config/warp_tokens.ts

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

