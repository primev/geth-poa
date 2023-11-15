ARG AGENT_BASE_IMAGE
FROM ${AGENT_BASE_IMAGE}

# Validator config, see: 
# - https://docs.hyperlane.xyz/docs/operators/validators/setup
# - https://docs.hyperlane.xyz/docs/operators/agent-configuration#config-layers

ENV CONFIG_FILES="/deploy-artifacts/agent_config.json"

ENV HYP_BASE_REORGPERIOD=20
ENV HYP_BASE_ORIGINCHAINNAME="mevcommitsettlement"
ENV HYP_BASE_CHAINS_MEVCOMMITSETTLEMENT_CONNECTION_URL="http://172.13.0.100:8545"
ENV HYP_BASE_DB="/val-db"
ENV HYP_BASE_CHECKPOINTSYNCER_TYPE="localStorage"
ENV HYP_BASE_CHECKPOINTSYNCER_PATH="/sigs"
# TODO: eval why keys specified as env vars did not work
