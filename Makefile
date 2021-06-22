include .env.local

user := $(shell id -u)
group := $(shell id -g)

ifeq ($(user), 1)
	test := "docker"
else
	test := "local"
endif

help:
	echo $(test)