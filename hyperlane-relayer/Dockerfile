# Image can be built for arm64 with https://github.com/hyperlane-xyz/hyperlane-monorepo/blob/main/rust/build.sh
# TODO: Rename to hyperlane-agent
FROM gcr.io/abacus-labs-dev/hyperlane-agent:8127fa5-20230823-161309

# Relayer config, see: 
# - https://docs.hyperlane.xyz/docs/operators/relayers/setup
# - https://docs.hyperlane.xyz/docs/operators/agent-configuration#config-layers

ENV CONFIG_FILES="/deploy-artifacts/agent_config.json"

# TODO: need to specify paths to signatures?

CMD ./relayer \
    --relayChains mevcommitsettlement,goerli \
    --chains.mevcommitsettlement.connection.url "http://172.13.0.100:8545" \
    --chains.goerli.connection.url "https://goerli.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161" \
    --db /relayer-db \
    --defaultSigner.key $RELAYER_PRIVATE_KEY \
    --allowLocalCheckpointSyncers true
