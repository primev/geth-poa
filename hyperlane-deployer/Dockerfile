FROM golang:1.21-alpine 

RUN apk add --no-cache git yarn

RUN git clone https://github.com/hyperlane-xyz/hyperlane-deploy.git
WORKDIR hyperlane-deploy
RUN yarn install
RUN yarn build

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

