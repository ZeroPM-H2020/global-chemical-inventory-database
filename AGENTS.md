# Repository Guidelines

## Project Structure & Module Organization
- `src/`: Python loader (`load_csv.py`), schema fixups (`recreate_tables.sql`), and examples.
- `csv_files/`: input datasets that feed the SQLite build.
- `zeropm-v0-0-*.sqlite`: generated database snapshots.
- `templates/`: Datasette UI templates.
- `metadata.yml`/`metadata.json`: Datasette metadata.
- `docker-compose.yml`, `custom-image/`, `build-custom-image-with-db.sh`: deployment helpers.
- `artifacts/`: exported artifacts and build outputs.

## Build, Test, and Development Commands
- `poetry install`: install Python dependencies.
- `make step-a-init-env`: open a Poetry shell for subsequent commands.
- `make step-b-load-csv`: load CSVs into a SQLite file via `src/load_csv.py`.
- `make step-c-fix-keys`: apply primary/foreign keys using `sqlite3` and `src/recreate_tables.sql`.
- `make step-d-serve`: run Datasette locally with templates and metadata.
- `make serve-docker`: run Datasette in Docker; `make up`/`make down` for compose.
- `make lfs-pull`: fetch large files tracked by Git LFS.

## Coding Style & Naming Conventions
- Python 3.10; format with Black (`poetry run black src`).
- Indentation: 4 spaces for Python, standard SQL formatting.
- Use snake_case for Python identifiers and SQL table/column names; keep CSV column names consistent with existing schema.

## Testing Guidelines
- No automated test suite is configured.
- Validate changes by rebuilding the SQLite database and serving it locally:
  - `make step-b-load-csv`
  - `make step-d-serve`
- For data changes, spot-check row counts or key relationships with `sqlite3 zeropm-v0-0-*.sqlite`.

## Commit & Pull Request Guidelines
- Commit messages are short, imperative, and unprefixed (examples in history: "Clear", "hotfix"). Follow that style.
- Open a PR and assign reviewers: raoul.wolf@ngi.no, sivani.baskaran@ngi.no, jiang.ye@ngi.no.
- In PR descriptions, include: data source changes, updated database file name/version, and commands run.
