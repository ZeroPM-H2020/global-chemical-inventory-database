.PHONY: help

container_id = $(shell docker ps -lq)

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

serve-docker-graphql: ## Serve the database using docker image with graphql plugin
	docker pull datasetteproject/datasette
	docker run datasetteproject/datasette pip install datasette-graphql
	docker commit $(container_id) datasette-with-plugins
	docker run -p 8001:8001 -v `pwd`:/mnt datasette-with-plugins datasette -p 8001 -h 0.0.0.0 /mnt/zeropm.sqlite

publish-vercel: ## Publish to Vercel
	datasette install datasette-publish-vercel
	datasette publish vercel zeropm.sqlite --project=zeropm  --token=${VERCEL_TOKEN}

up: ## Start the container
	docker-compose up -d

down: ## Stop the container
	docker-compose down

logs: ## Show docker container logs
	docker-compose logs -t

clear: ## Clear
	rm zeropm.sqlite

# Reference: https://github.com/git-lfs/git-lfs/blob/main/INSTALLING.md
install-git-lfs-ubuntu: ## Install git lfs for ubuntu
	curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
	sudo apt-get install git-lfs

lfs-meta-data: ## Retrieve the latest lfs meta-data from remote
	git lfs fetch --all

lfs-pull: ## Pull lfs data copy from remote
	git lfs pull

#Reference: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
