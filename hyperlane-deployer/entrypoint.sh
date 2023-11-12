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

# Infinite loop
while true; do sleep 30; done;
