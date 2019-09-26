.DEFAULT_GOAL := help

build: ##Builds dev, test and prod images
	@echo "Build triggered"
	docker-compose up --build

dev: ##Runs bash in DEV container
	@echo "Dev triggered"
	docker-compose run --rm app-development bash

help: ##Runs bash in dev container
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

prod: ##Runs bash in PROD container
	@echo "Prod triggered"
	docker-compose run --rm app-production bash

test: ##Runs bash in TEST container
	@echo "Test triggered"
	docker-compose run --rm app-test bash
