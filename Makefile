include .env

.DEFAULT_GOAL := help
.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

PHONY: up
up: ## docker-compose up -d
	$(MK_DOCKER_COMPOSE_UP_D)

PHONY: down
down: ## docker-compose down
	$(MK_DOCKER_COMPOSE_DOWN)

PHONY: ps
ps: ## docker-compose ps
	$(MK_DOCKER_COMPOSE_PS)

PHONY: psa
psa: ## docker-compose ps -a
	$(MK_DOCKER_COMPOSE_PS) -a

PHONY: ipf
ipf: ## docker image prune (This will remove all dangling images.)
	$(MK_DOCKER_IMAGE_PRUNE) -f

PHONY: cpf
cpf: ## docker container prune (This will remove all stopped containers.)
	$(MK_DOCKER_CONTAINER_PRUNE) -f

PHONY: app
app: ## docker-compose exec app bash
	$(MK_DOCKER_COMPOSE_EXEC) app bash
