# Build docker image from specified datasette version and database file

# Usage: ./build-custom-image-with-db.sh <datasette-version> <database-file>
# Example: ./build-custom-image-with-db.sh 0.59 /path/to/database.db

# using datasette from https://github.com/fgregg/datasette/commits/no_limit_csv_publish
# using Dockerfile from https://github.com/simonw/datasette/raw/main/Dockerfile
# using db from ./zeropm-v0-0-3.sqlite
# using templates from ./templates
# using config file from ./metadata.yml

# download dockerfile to custom-image folder
# wget https://github.com/simonw/datasette/raw/main/Dockerfile -O custom-image/Dockerfile

# install from latest commit of no_limit_csv_publish branch
# docker build -f ./custom-image/Dockerfile . -t  yejiyang/datasette:no-limit-csv-publish-latest-v1

# install from 20221223 commit of no_limit_csv_publish branch
docker build -f ./custom-image/Dockerfile . -t  yejiyang/datasette:no-limit-csv-publish-20221223-v4