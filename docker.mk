include .env

.PHONY: up down stop prune main logs

default: up

up:
	@echo "Starting up containers for $(PROJECT_NAME)..."
	docker-compose pull
	docker-compose up -d --remove-orphans
	@echo "Tika up at http://localhost:9998/tika"

down: stop

stop:
	@echo "Stopping containers for $(PROJECT_NAME)..."
	@docker-compose stop

prune:
	@echo "Removing containers for $(PROJECT_NAME)..."
	@docker-compose down -v

main:
	docker exec $(shell docker ps --filter name='$(PROJECT_NAME)_app' --format "{{ .ID }}") go run main.go

logs:
	@docker-compose logs -f $(filter-out $@,$(MAKECMDGOALS))

%:
	@: