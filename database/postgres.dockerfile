FROM postgres:16.2-alpine

LABEL author="William"
LABEL description="Postgres Image for demo"
LABEL version="1.0"

COPY 01-init-db.sql /docker-entrypoint-initdb.d/
COPY 02-load-data.sql /docker-entrypoint-initdb.d/
