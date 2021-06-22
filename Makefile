include .env.local

isDocker := $(bash docker info > /dev/null 2>&1 echo 1)

ifeq ($(isDocker), 1)
	test := "docker"
else
	test := "local"
endif

help:
	echo $(test)