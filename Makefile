PWD = $(shell pwd)/$(shell dirname $(MAKEFILE_LIST))
SSH_HOST = avialeta

build-dev:
	cd $(PWD)/dev/docker/ui && \
	docker build -t gcr.io/devel-fellah/aivialeta-ui .
	docker push gcr.io/devel-fellah/aivialeta-ui

.DEFAULT_GOAL := build-dev

.PHONY: build-dev
