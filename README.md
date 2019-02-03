# CRP loader

A Postgres loader for bulk data from the Center for Responsive Politics.

Requires Bash, 7za, aws-cli, psql, Node.js.

Run it like this:
```bash
export PGHOST=<database host> PGDATABASE=<database name> PGUSER=<database user> PGPASSWORD=<database password>
npx PublicI/crp-loader
```

Or use the Docker image:
```bash
docker run -e PGHOST=<database host> -e PGDATABASE=<database name> -e PGPASSWORD=<database password> -e PGPORT=5432 -e PGUSER=<database user> -e publicintegrity/crp-loader
```
