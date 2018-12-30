# CRP loader

A Postgres loader for bulk data from the Center for Responsive Politics.

```bash
chmod +x load.sh
export USERS= PGHOST=<database host> PGDATABASE=<database name> PGUSER=<database user> PGPASSWORD=<database password>
./load.sh
```

Or,
```bash
docker run -e PGHOST=<database host> -e PGDATABASE=<database name> -e PGPASSWORD=<database password> -e PGPORT=5432 -e PGUSER=<database user> -e USERS= publicintegrity/crp-loader
```
