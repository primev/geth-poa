FROM node:20.9-bullseye

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git

RUN git clone https://github.com/hyperlane-xyz/hyperlane-deploy.git
WORKDIR hyperlane-deploy
RUN yarn install

RUN curl -L https://foundry.paradigm.xyz | bash
ENV PATH="${PATH}:/root/.foundry/bin"
RUN foundryup

# Overwrite chains.ts 
COPY chains.ts config/chains.ts

# Overwrite multisig_ism.ts
COPY multisig_ism.ts config/multisig_ism.ts

# Overwrite start_blocks.ts
COPY start_blocks.ts config/start_blocks.ts

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
