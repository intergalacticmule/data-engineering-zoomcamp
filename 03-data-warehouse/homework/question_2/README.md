## Question 1 

>Write a query to count the distinct number of PULocationIDs for the entire dataset on both the tables.
>
>What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?
>
>- 18.82 MB for the External Table and 47.60 MB for the Materialized Table
>- 0 MB for the External Table and 155.12 MB for the Materialized Table
>- 2.14 GB for the External Table and 0MB for the Materialized Table
>- 0 MB for the External Table and 0MB for the Materialized Table

## Solution:

Highlight each of the following SQL queries:

```sql
--Query 1:
SELECT
  COUNT(DISTINCT(PULocationID))
FROM
  totallyawesometaxidataset.ny_taxi_2024_data_external;
  
--Query 2:
SELECT
  COUNT(DISTINCT(PULocationID))
FROM
  totallyawesometaxidataset.ny_taxi_2024_data;
```

### Final result:
Query 1:

![result_1](result_1.png)

Query 2:

![result_2](result_2.png)
