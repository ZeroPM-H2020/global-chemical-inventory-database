# 🚧 How to contribute

Follow the steps abcd at [Makefile](./Makefile).

Please create a pull request and assign the following people as reviewers:
raoul.wolf@ngi.no
sivani.baskaran@ngi.no
jiang.ye@ngi.no

## Setup local environment

1. Install VScode and plugins (SQLite Viewer extension, and others, see [extensions.json](.vscode/extensions.json))

2. Install Git & clone GitHub Repository

3. Install Python & poetry

4. Install Install SQLite https://sqlite.org/download.html

5. (Optional) Install Make - An easy way to organize all the commands

6. (Optional) Install WSL & Ubuntu 22.04 - The environment that the scripts/code have been developed & tested.

7. (Optional) Install docker - If you want to test deployment.

## Common scenarios of updating the ZeroPM database

1. No changes on data model, and only append new rows to existing table.

2. Add new tables and its schema.

## Bump database version number

1. Pick the next version number and new filename like `zeropm-v0-0-X.sqlite`.
2. Update the filename/version in `Makefile`, `src/load_csv.py`, `metadata.yml` (both the `description_html` text and `databases` key), `custom-image/Dockerfile`, `docker-compose.yml`, and `build-custom-image-with-db.sh`.
3. Rebuild the database: `make step-b-load-csv` then `make step-c-fix-keys`.
4. Spot-check the new file with `sqlite3 zeropm-v0-0-X.sqlite` if you changed data or schema.

## Build a new docker image

1. Ensure `custom-image/Dockerfile` references the new `zeropm-v0-0-X.sqlite` file and `metadata.yml`.
2. Build the image with a new tag, either by editing `build-custom-image-with-db.sh` or running `docker build -f ./custom-image/Dockerfile . -t yejiyang/datasette:<new-tag>`.
3. Update the image tag in `docker-compose.yml` to match the new tag.
4. Test locally with `make up` or `make serve-docker`.
