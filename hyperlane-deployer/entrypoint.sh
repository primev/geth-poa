#!/bin/sh
set -exu

sleep 5

if test -f artifacts/done; then
  echo "Deploy artifacts already exist. Skipping deployment."
else
  echo "Deploy artifacts do not exist. Deploying."
  yarn ts-node scripts/deploy-hyperlane.ts --local mevcommitsettlement \
    --remotes goerli \
    --key $CONTRACT_DEPLOYER_PRIVATE_KEY

  # Signal done 
  touch artifacts/done
fi

# DEBUG=hyperlane* yarn ts-node scripts/test-messages.ts \
#   --chains goerli mevcommitsettlement \
#   --key $CONTRACT_DEPLOYER_PRIVATE_KEY

# TODO: may need to specify owner and other addrs

if test -f artifacts/done-warp-route; then
  echo "Warp route already deployed. Skipping."
else
  echo "Deploying warp route."
  DEBUG=hyperlane* yarn ts-node scripts/deploy-warp-routes.ts \
    --key $CONTRACT_DEPLOYER_PRIVATE_KEY

  touch artifacts/done-warp-route
fi

yarn ts-node scripts/test-warp-transfer.ts \
  --origin goerli --destination mevcommitsettlement --wei 1 \
  --recipient 0xdCfaD16AF20410D24757d0ae9366e122B55Af405 \
  --key $CONTRACT_DEPLOYER_PRIVATE_KEY
