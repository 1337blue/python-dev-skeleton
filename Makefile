#!/usr/bin/make

DOCKER_IMAGE_NAME:=project-name
DOCKER_RUN_PREFIX:=docker run --network host --rm -it -v $(PWD):/opt/ct -w /opt/ct $(DOCKER_IMAGE_NAME):latest

format:
	@$(MAKE) format -C python

format-gha:
	@$(MAKE) format-gha -C python

build-docker:
	@docker build -t $(DOCKER_IMAGE_NAME):latest .

develop-docker:
	@$(DOCKER_RUN_PREFIX) bash

install-pip-deps:
	@pip3 install -r python/requirements.txt

lint-docker:
	@$(DOCKER_RUN_PREFIX) $(MAKE) lint

lint:
	@$(MAKE) -C python lint

test-docker:
	@$(DOCKER_RUN_PREFIX) make test

test:
	@test -C python

test-integration:
	@$(MAKE) test-integration -C python
