.PHONY: help

init-env: ## Install python packages
	poetry install
	poetry shell

load-csv: ## Load csv files
	poetry run python src/load_csv.py 

fix-keys: ## Fix table keys
	sqlite3 zeropm.sqlite < ./src/recreate_tables.sql

serve: ## Serve the database
	datasette serve zeropm.sqlite

serve-docker: ## Serve the database using docker image
	docker pull datasetteproject/datasette
	docker run -p 8001:8001 -v `pwd`:/mnt datasetteproject/datasette datasette -p 8001 -h 0.0.0.0 /mnt/zeropm.sqlite

up: ## Start the container
	docker-compose up -d

down: ## Stop the container
	docker-compose down

logs: ## Show docker container logs
	docker-compose logs -t

clear: ## Clear
	rm zeropm.sqlite

#Reference: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
