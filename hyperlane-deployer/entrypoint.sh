#!/bin/sh
set -exu

sleep 5

if test -f /deploy-artifacts/done; then
  echo "Deploy artifacts already exist. Skipping deployment."
else
  echo "Deploy artifacts do not exist. Deploying."
  yarn ts-node scripts/deploy-hyperlane.ts --local mevcommitsettlement \
    --remotes goerli \
    --key $CONTRACT_DEPLOYER_PRIVATE_KEY

  # COPY addresses.json and agent_config.json to deploy artifacts volume
  cp artifacts/addresses.json /deploy-artifacts/addresses.json
  cp artifacts/agent_config.json /deploy-artifacts/agent_config.json

  # Signal done 
  touch /deploy-artifacts/done
fi

# Shim to run test script, move file to where their script expects it
mkdir -p ./artifacts
cp /deploy-artifacts/addresses.json ./artifacts/addresses.json

DEBUG=hyperlane* yarn ts-node scripts/test-messages.ts \
  --chains goerli mevcommitsettlement \
  --key $CONTRACT_DEPLOYER_PRIVATE_KEY

# Infinite loop
while true; do sleep 30; done;
