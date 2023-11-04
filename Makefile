up:
	docker-compose up -d --build

down:
	docker-compose down

clean-docker:
	-docker-compose down --rmi all --volumes
	-docker-compose rm -fv
	docker image prune -f
