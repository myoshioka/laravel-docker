# install postgis
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS postgis;
EOSQL


# testing database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER test WITH PASSWORD 'test';
    CREATE DATABASE test;
    GRANT ALL PRIVILEGES ON DATABASE test TO test;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname test <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS postgis;
EOSQL
