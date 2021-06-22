include .env.local

user    := $(shell id -u)
group   := $(shell id -g)

ifeq ($(APP_ENV), prod)
	dc := USER_ID=$(user) GROUP_ID=$(group) docker-compose -f docker-compose.prod.yaml
else ifeq ($(APP_ENV), dev)
	dc := USER_ID=$(user) GROUP_ID=$(group) docker-compose -f docker-composer.dev.yaml
endif

de := docker-compose exec
dr := $(dc) run --rm
sy := $(de) php bin/console

help:
	@echo "################################"
	@echo "# ENV :" $(APP_ENV)
	@echo "################################"
	@echo "docker-build"

docker-build:
	$(dc) pull --ignore-pull-failures
	$(dc) build node
	$(dc) build php