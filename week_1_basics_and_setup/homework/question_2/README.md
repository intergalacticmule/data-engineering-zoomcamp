## Question 2 - Understanding Docker networking and docker-compose

>Given the following docker-compose.yaml, what is the hostname and port that pgadmin should use to connect to the postgres database?
```yaml
services:
  db:
    container_name: postgres
    image: postgres:17-alpine
    environment:
      POSTGRES_USER: 'postgres'
      POSTGRES_PASSWORD: 'postgres'
      POSTGRES_DB: 'ny_taxi'
    ports:
      - '5433:5432'
    volumes:
      - vol-pgdata:/var/lib/postgresql/data

  pgadmin:
    container_name: pgadmin
    image: dpage/pgadmin4:latest
    environment:
      PGADMIN_DEFAULT_EMAIL: "pgadmin@pgadmin.com"
      PGADMIN_DEFAULT_PASSWORD: "pgadmin"
    ports:
      - "8080:80"
    volumes:
      - vol-pgadmin_data:/var/lib/pgadmin  

volumes:
  vol-pgdata:
    name: vol-pgdata
  vol-pgadmin_data:
    name: vol-pgadmin_data
```
>- postgres:5433  
>- localhost:5432
>- db:5433
>- postgres:5432
>- db:5432

## Solution:

### Step 1:
Create [docker-compose.yaml](docker-compose.yaml) with the necessary services

### Step 2: 
Get postgres and pgadmin containers running:

_docker compose up (-d)_

### Step 3: 
Navigate to pgadmin Web UI via browser (localhost:8080)

### Step 4: Create a connection with the following credentials:
__Hostname/address:__ _db_

__Port:__ _5432_

__Username:__ _postgres_

__Password__ _postgres_

### Final result:
The correct answer is thus _db:5432_