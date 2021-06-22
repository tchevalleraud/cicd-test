include .env.local

isLinux := $(shell id -u > /dev/null 2>&1 echo 1)
user := $(shell id -u)
group := $(shell id -g)

ifeq ($(user), 1)
	test := "docker"
else
	test := "local"
endif

help:
	echo $(isLinux)
	echo $(user)
	echo $(group)
	echo $(test)