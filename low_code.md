# Notes for testing low code platform

1. soul, https://github.com/thevahidal/soul
   Surprisingly easy, almost fulfill all requests.

how to:

```
npm install -g soul-cli
soul -d sqlite.db -p 8000
```

2. nocodb, https://github.com/nocodb/nocodb
   Seems powerful and popular, but I could not find a way to import sqlite database

3. Datasette, https://github.com/simonw/datasette
   Seems like a prefect match, immutable(read-only) apis.

how to:

```
  poetry shell
  poetry add datasette

  datasette serve path/to/database.db
```

api test:https://simonwillison.net/2017/Nov/13/datasette/

---

---

check out: https://github.com/simonw/csvs-to-sqlite

3. postgrest, https://github.com/PostgREST/postgrest

4. Hasura

5. DreamFactory

...
Supabase
PostgREST
ZenStack
Hasura (no sqlite support at now?)
WunderGraph

Airbyte ? Grouparoo (sqlite3 import)

Tooljet

---

new db,
try Neon - serverless PostgreSQL

## Key reference:

Exposing Databases to the Internet: Seriously?:https://dev.to/zenstack/exposing-databases-to-the-internet-seriously-2n1a
A list of software that turns your database into a REST/GraphQL API:https://github.com/dbohdan/automatic-api/
