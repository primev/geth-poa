up-prod:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	AGENT_BASE_IMAGE=gcr.io/abacus-labs-dev/hyperlane-agent:8127fa5-20230823-161309 L2_NODE_URL=http://34.215.163.180:8545 docker compose up -d	

up-prod-build:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	AGENT_BASE_IMAGE=gcr.io/abacus-labs-dev/hyperlane-agent:8127fa5-20230823-161309 L2_NODE_URL=http://34.215.163.180:8545 docker compose up -d --build

up-dev:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	AGENT_BASE_IMAGE=shaspitz/hyperlane-validator:v0-mac L2_NODE_URL=http://localhost:8545 docker compose up -d

up-dev-build:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	AGENT_BASE_IMAGE=shaspitz/hyperlane-validator:v0-mac L2_NODE_URL=http://localhost:8545 docker compose up -d --build

down:
	docker compose down

clean-docker:
	-docker compose down --rmi all --volumes
	-docker compose rm -fv
	docker image prune -f

pull-image:
	docker pull shaspitz/geth-poa:v0
