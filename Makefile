run: init submodules build up submodules status

init:
	@echo "service initialization started..."

submodules:
	@echo "[clone modules]"
	git submodule update --init --recursive

build:
	@echo "[build docker images]"
	docker-compose build --no-cache

up:
	@echo "[running docker containers]"
	docker-compose up -d

status:
	docker-compose ps

down:
	@echo "[stopping docker containers]"
	docker-compose down
msg:
	docker exec -it generator sh -c "./main msg:gen"

watch:
	docker logs processor -f -t

