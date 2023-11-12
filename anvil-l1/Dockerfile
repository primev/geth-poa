FROM node:20.9-bullseye

# install foundry
RUN curl -L https://foundry.paradigm.xyz | bash
ENV PATH="${PATH}:/root/.foundry/bin"
RUN foundryup

EXPOSE 8545

CMD ["anvil", "--block-time", "12", "--host", "172.13.0.75"]
