.PHONY: help

init-env: ## Install python packages
	poetry install
	poetry shell

load-csv: ## Load csv files
	poetry shell 
	python src/load_csv.py 

fix-keys: ## Fix table keys
	sqlite3 output.sqlite < ./src/recreate_tables.sql

clear: ## Clear
	rm output.sqlite

#Reference: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'