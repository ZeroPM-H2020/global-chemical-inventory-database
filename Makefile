.PHONY: help

container_id = $(shell docker ps -lq)
db_name=zeropm-v0-0-3.sqlite
metadata=metadata.yml

step-a-init-env: ## Step 1: install python packages
#poetry install
	poetry shell

step-b-load-csv: ## Step 2: load csv files
	poetry run python src/load_csv.py 

# for powershell
# How to install sqlite3 on windows: https://www.sqlitetutorial.net/download-install-sqlite/
# cat ./src/recreate_tables.sql | & C:/sqlite $(db_name)
step-c-fix-keys: ## Step 3: fix relationship between tables by adding primary & secondary keys
	sqlite3 $(db_name) < ./src/recreate_tables.sql

# if time out error, add additional time limit settings like:
# datasette serve $(db_name) --setting sql_time_limit_ms 3500
step-d-serve: ## Step 4: serve the database locally
	poetry run datasette serve $(db_name) -m $(metadata) --setting sql_time_limit_ms 600000 --setting max_returned_rows 1000000  --setting max_csv_mb 0

step-e-clear: ## Step 5: clear
	rm $(db_name)

serve-docker: ## Serve the database using docker image
	docker pull datasetteproject/datasette
	docker run -p 8001:8001 -v `pwd`:/mnt datasetteproject/datasette datasette -p 8001 -h 0.0.0.0 /mnt/$(db_name)

serve-docker-graphql: ## Serve the database using docker image with graphql plugin
	docker pull datasetteproject/datasette
	docker run datasetteproject/datasette pip install datasette-graphql
	docker commit $(container_id) datasette-with-plugins
	docker run -p 8001:8001 -v `pwd`:/mnt datasette-with-plugins datasette -p 8001 -h 0.0.0.0 /mnt/$(db_name)

publish-vercel: ## Publish to Vercel - failed!
	datasette install datasette-publish-vercel
	datasette publish vercel $(db_name) --project=zeropm  --token=${VERCEL_TOKEN}

# install Google Cloud CLI: https://cloud.google.com/sdk/docs/install-sdk
# https://zeropm-database-e3h7y7vjcq-lz.a.run.app
# gcloud auth login
publish-google-cloud-run: ## Publish to google cloud run
	gcloud config set run/region europe-north1
	gcloud config set project zeropm
	datasette publish cloudrun $(db_name) --service=zeropm-database -m $(metadata) --extra-options="--setting sql_time_limit_ms 3500"
# datasette publish cloudrun zeropm-v0-0-3.sqlite --service=zeropm-database -m metadata.json --extra-options="--setting sql_time_limit_ms 3500"

up: ## Start the container
	docker-compose up -d

down: ## Stop the container
	docker-compose down

logs: ## Show docker container logs
	docker-compose logs -t

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
