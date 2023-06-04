#!/usr/bin/make

INTEGRATION_TEST_DIR=tests/integration

format:
	@black .

format-gha:
	@black --diff --check --color .

lint:
	@$(MAKE) lint-base
	@$(MAKE) lint-tests

lint-base:
	@pylint *.py lib

lint-tests:
	@cd tests && pylint *.py fixtures

test:
	@coverage run -m pytest --dist=loadscope -n 5 --cov=./ -v --ignore=$(INTEGRATION_TEST_DIR)

test-integration:
	@coverage run -m pytest $(INTEGRATION_TEST_DIR) --cov=./ -v

prisma-identification:
	@./main.py identification

prisma-screening:
	@./main.py screening
