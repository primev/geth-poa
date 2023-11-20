up-prod:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	AGENT_BASE_IMAGE=gcr.io/abacus-labs-dev/hyperlane-agent:8127fa5-20230823-161309 L2_NODE_URL=http://34.215.163.180:8545 docker compose --profile settlement --profile bridge up -d	

up-prod-build:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	AGENT_BASE_IMAGE=gcr.io/abacus-labs-dev/hyperlane-agent:8127fa5-20230823-161309 L2_NODE_URL=http://34.215.163.180:8545 docker compose --profile settlement --profile bridge up -d --build

up-dev:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	AGENT_BASE_IMAGE=shaspitz/hyperlane-validator:v0-mac L2_NODE_URL=http://localhost:8545 docker compose --profile settlement --profile bridge up -d

up-dev-build:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	AGENT_BASE_IMAGE=shaspitz/hyperlane-validator:v0-mac L2_NODE_URL=http://localhost:8545 docker compose --profile settlement --profile bridge up -d --build

up-dev-settlement:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	AGENT_BASE_IMAGE=shaspitz/hyperlane-validator:v0-mac L2_NODE_URL=http://localhost:8545 docker compose --profile settlement up -d --build

down:
	AGENT_BASE_IMAGE=nil L2_NODE_URL=nil docker compose --profile settlement --profile bridge down

clean-dbs:
	@read -p "WARNING: This command will wipe all persistent disk data relevant to the containers. Press enter to continue or Ctrl+C to cancel." _ 
	-docker compose --profile settlement --profile bridge down --rmi all --volumes
	-docker compose --profile settlement --profile bridge rm -fv
	docker image prune -f

pull-image:
	docker pull shaspitz/geth-poa:v0
