.DEFAULT_GOAL := help
MAKEFILE_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: up
up: ## Run docker containers
	docker-compose up

.PHONY: down
down: ## Stop docker containers
	docker-compose down

.PHONY: prune
prune: ## Stop docker containers and delete all
	docker-compose down --rmi all --volumes --remove-orphans

.PHONY: help
help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

