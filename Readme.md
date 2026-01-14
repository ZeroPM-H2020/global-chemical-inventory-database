# Global Chemical Inventory Database

This repository builds the ZeroPM Global Chemical Inventory SQLite database and serves it with Datasette.

Deployment: https://database.zeropm.eu/

## Quick links

- Build and serve steps in `Makefile`
- Contributor guide: `how_to_contribute.md`
- Project TODO list: `how_to_contribute.md#project-todo-list-suggested-improvements`
- Deployment TODO list: `how_to_contribute.md#deployment-todo-list-suggested-improvements`

## Local workflow (short)

1. `poetry install`
2. `make step-a-init-env`
3. `make step-b-load-csv`
4. `make step-c-fix-keys`
5. `make step-d-serve`

## Contact

Raoul Wolf, raoul.wolf@ngi.no  
Sivani Baskaran, sivani.baskaran@ngi.no  
Jiyang Ye, jiang.ye@ngi.no  
Hans Peter Arp, hans.peter.arp@ngi.no
