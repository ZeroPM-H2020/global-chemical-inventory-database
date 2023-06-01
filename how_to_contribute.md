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
