## Question 1 

Provided you've got the following sources.yaml

```yaml
version: 2

sources:
  - name: raw_nyc_tripdata
    database: "{{ env_var('DBT_BIGQUERY_PROJECT', 'dtc_zoomcamp_2025') }}"
    schema:   "{{ env_var('DBT_BIGQUERY_SOURCE_DATASET', 'raw_nyc_tripdata') }}"
    tables:
      - name: ext_green_taxi
      - name: ext_yellow_taxi
```

with the following env variables setup where dbt runs:

```shell
export DBT_BIGQUERY_PROJECT=myproject
export DBT_BIGQUERY_DATASET=my_nyc_tripdata
```
What does this .sql model compile to?

```sql
select * 
from {{ source('raw_nyc_tripdata', 'ext_green_taxi' ) }}
```

- >select * from dtc_zoomcamp_2025.raw_nyc_tripdata.ext_green_taxi
- >select * from dtc_zoomcamp_2025.my_nyc_tripdata.ext_green_taxi
- >select * from myproject.raw_nyc_tripdata.ext_green_taxi
- >select * from myproject.my_nyc_tripdata.ext_green_taxi
- >select * from dtc_zoomcamp_2025.raw_nyc_tripdata.green_taxi

## Solution:

### Step 1:
Create a schema.yml file with the following content:

```yaml
version: 2

sources:
  - name: raw_nyc_tripdata
    database: "{{ env_var('DBT_BIGQUERY_PROJECT', 'dtc_zoomcamp_2025') }}"
    schema:   "{{ env_var('DBT_BIGQUERY_SOURCE_DATASET', 'raw_nyc_tripdata') }}"
    tables:
      - name: ext_green_taxi
      - name: ext_yellow_taxi
```

### Step 2:
Create a model SQL file with the following content

```sql
select * 
from {{ source('raw_nyc_tripdata', 'ext_green_taxi' ) }}
```

### Step 3:
Compile the model

## Final result:
```sql
select * 
from `dtc_zoomcamp_2025`.`raw_nyc_tripdata`.`ext_green_taxi`
```