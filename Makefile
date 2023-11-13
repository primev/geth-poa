up:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	docker compose up -d

up-build:
	@if [ ! -f .env ]; then echo "Error: .env file not found. Please populate the .env file before running this command."; exit 1; fi
	docker compose up -d --build

down:
	docker compose down

clean-docker:
	-docker compose down --rmi all --volumes
	-docker compose rm -fv
	docker image prune -f

pull-image:
	docker pull shaspitz/geth-poa:v0
