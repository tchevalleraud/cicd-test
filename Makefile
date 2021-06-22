include .env.local

user    := $(shell id -u)
group   := $(shell id -g)

ifeq ($(APP_ENV), prod)
	dc := USER_ID=$(user) GROUP_ID=$(group) docker-compose -f docker-compose.prod.yaml
else ifeq ($(APP_ENV), dev)
	dc := USER_ID=$(user) GROUP_ID=$(group) docker-compose -f docker-compose.dev.yaml
endif

dr      := $(dc) run --rm
de      := $(dc) exec

node    := $(dr) node
php     := $(dr) --no-deps php

sy      := $(php) php bin/console

help:
	@echo "################################"
	@echo "# ENV :" $(APP_ENV)
	@echo "################################"
	@echo "docker-build"

docker-build:
	$(dc) pull --ignore-pull-failures
	$(dc) build node
	$(dc) build php

# --------------------------------
# Dépendances
# --------------------------------
public/assets:
	$(node) yarn
	$(node) yarn run build

vendor/autoload.php:
	$(php) composer update
	touch vendor/autoload.php