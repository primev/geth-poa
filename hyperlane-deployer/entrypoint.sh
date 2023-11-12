#!/bin/sh
set -exu

sleep 5

# Send 100ether to contract deployer account using anvil private key #1
cast send \
    --value 100ether \
    --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
    --rpc-url http://172.13.0.75:8545 \
    0xdCfaD16AF20410D24757d0ae9366e122B55Af405

# TODO: prob need to fund other accounts too

yarn ts-node scripts/deploy-hyperlane.ts --local anvil \
  --remotes goerli \
  --key $CONTRACT_DEPLOYER_PRIVATE_KEY

yarn ts-node scripts/deploy-hyperlane.ts --local mevcommitsettlement \
  --remotes anvil \
  --key $CONTRACT_DEPLOYER_PRIVATE_KEY

# Infinite loop
while true; do sleep 30; done;
