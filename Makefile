PWD = $(shell pwd)/$(shell dirname $(MAKEFILE_LIST))
SSH_HOST = avialeta

setup-dev:
	scp -r $(PWD)/dev/systemd/* $(SSH_HOST):~/.config/systemd/user
	ssh $(SSH_HOST) 'systemctl --user daemon-reload'
	ssh $(SSH_HOST) 'systemctl --user enable avialeta.target'
	ssh $(SSH_HOST) 'systemctl --user restart avialeta.target'

build-dev-ui:
	cd $(PWD)/dev/docker/ui && \
	docker build -t fellah/avialeta-ui .
	docker push fellah/avialeta-ui

build-dev-api:
	cd $(GOPATH)/src/github.com/avialeta/api && \
	go build -o $(PWD)/dev/docker/api/avialeta-api
	cd $(PWD)/dev/docker/api && \
	docker build -t fellah/avialeta-api .
	docker push fellah/avialeta-api

build-dev: build-dev-api build-dev-ui

deploy-dev: build-dev
	ssh $(SSH_HOST) 'docker pull fellah/avialeta-api'
	ssh $(SSH_HOST) 'docker pull fellah/avialeta-ui'
	ssh $(SSH_HOST) 'systemctl --user restart avialeta.target'

.DEFAULT_GOAL := deploy-dev

.PHONY: build-dev deploy-dev
