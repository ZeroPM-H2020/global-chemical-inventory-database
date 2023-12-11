FROM python:3.9.2-slim-buster as build
# source of this dockerfile: https://github.com/simonw/datasette/blob/main/Dockerfile

# Version of Datasette to install, e.g. 0.55
#   docker build . -t datasette --build-arg VERSION=0.55
# docker build . -t yejiyang/datasette:no-limit-csv-publish-latest-v1
ARG VERSION

RUN apt-get update && \
    apt-get install -y --no-install-recommends libsqlite3-mod-spatialite && \
    apt clean && \
    rm -rf /var/lib/apt && \
    rm -rf /var/lib/dpkg/info/*

RUN pip install https://github.com/fgregg/datasette/archive/refs/heads/no_limit_csv_publish.zip && \
    find /usr/local/lib -name '__pycache__' | xargs rm -r && \
    rm -rf /root/.cache/pip

ADD zeropm-v0-0-3.sqlite /usr/local/data/zeropm-v0-0-3.sqlite
ADD metadata.yml /usr/local/data/metadata.yml
ADD templates /usr/local/data/templates

EXPOSE 8001
CMD ["datasette"]
