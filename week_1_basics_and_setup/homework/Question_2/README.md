## Solution to question 2

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