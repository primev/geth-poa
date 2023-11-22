ARG AGENT_BASE_IMAGE
FROM ${AGENT_BASE_IMAGE}

# Relayer config, see: 
# - https://docs.hyperlane.xyz/docs/operators/relayers/setup
# - https://docs.hyperlane.xyz/docs/operators/agent-configuration#config-layers

ENV CONFIG_FILES="/deploy-artifacts/agent-config.json"

# TODO: enforce minimum gas payment in prod

CMD ./relayer \
    --relayChains mevcommitsettlement,goerli \
    --chains.mevcommitsettlement.connection.url "http://172.13.0.100:8545" \
    --chains.goerli.connection.url "https://goerli.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161" \
    --db /relayer-db \
    --defaultSigner.key $RELAYER_PRIVATE_KEY \
    --allowLocalCheckpointSyncers true \
    --gasPaymentEnforcement '[{"type": "none"}]'
