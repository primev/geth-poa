#!/bin/sh
set -exu

sleep 30

yarn ts-node scripts/deploy-hyperlane.ts --local mevcommitsettlement \
  --remotes goerli \
  --key $CONTRACT_DEPLOYER_PRIVATE_KEY

# Infinite loop
while true; do sleep 30; done;
