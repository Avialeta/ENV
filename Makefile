PWD = $(shell pwd)/$(shell dirname $(MAKEFILE_LIST))
SSH_HOST = avialeta

build-dev:
	cd $(PWD)/dev/docker/ui && \
	docker build -t gcr.io/devel-fellah/avialeta-ui .
	docker push gcr.io/devel-fellah/avialeta-ui

deploy-dev: build-dev
	ssh $(SSH_HOST) 'docker pull gcr.io/devel-fellah/avialeta-ui'

.DEFAULT_GOAL := deploy-dev

.PHONY: build-dev deploy-dev
