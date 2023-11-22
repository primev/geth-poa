#!/bin/sh
set -exu

sleep 10

if test -f /hyperlane-monorepo/artifacts/done; then
  echo "Deploy artifacts already exist. Skipping deployment."
else

  # Define the expect script inline
  /usr/bin/expect <<EOF
  set timeout -1
  spawn hyperlane deploy core \
    --yes \
    --targets goerli,mevcommitsettlement \
    --chains /chain-config.yml \
    --ism /multisig-ism.yml \
    --out "/hyperlane-monorepo/artifacts" \
    --key $CONTRACT_DEPLOYER_PRIVATE_KEY
  expect {
    "? Do you want use some existing contract addresses? (Y/n)" {
      send -- "n\r"
      exp_continue
    }
    "*low balance on*" { 
      send -- "y\r"
      exp_continue
    }
    eof
  }
EOF

  # Standardize artifact names
  for file in /hyperlane-monorepo/artifacts/agent-config-*.json; do
    mv "$file" "/hyperlane-monorepo/artifacts/agent-config.json"
  done
  for file in /hyperlane-monorepo/artifacts/core-deployment-*.json; do
    mv "$file" "/hyperlane-monorepo/artifacts/core-deployment.json"
  done

  # Signal done
  touch /hyperlane-monorepo/artifacts/done
fi

# while true; do
#   sleep 5
# done

# DEBUG=hyperlane* yarn ts-node scripts/test-messages.ts \
#   --chains goerli mevcommitsettlement \
#   --key $CONTRACT_DEPLOYER_PRIVATE_KEY

# TODO: may need to specify owner and other addrs

# if test -f artifacts/done-warp-route; then
#   echo "Warp route already deployed. Skipping."
# else
#   echo "Deploying warp route."
#   DEBUG=hyperlane* yarn ts-node scripts/deploy-warp-routes.ts \
#     --key $CONTRACT_DEPLOYER_PRIVATE_KEY

#   touch artifacts/done-warp-route
# fi

# yarn ts-node scripts/test-warp-transfer.ts \
#   --origin goerli --destination mevcommitsettlement --wei 1 \
#   --recipient 0xdCfaD16AF20410D24757d0ae9366e122B55Af405 \
#   --key $CONTRACT_DEPLOYER_PRIVATE_KEY

# yarn ts-node scripts/test-warp-transfer.ts \
#   --origin mevcommitsettlement --destination goerli --wei 1 \
#   --recipient 0xdCfaD16AF20410D24757d0ae9366e122B55Af405 \
#   --key $CONTRACT_DEPLOYER_PRIVATE_KEY
