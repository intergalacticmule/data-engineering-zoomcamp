## Question 6

>Write a query to retrieve the distinct VendorIDs between tpep_dropoff_datetime 2024-03-01 and 2024-03-15 (inclusive)
>
>Use the materialized table you created earlier in your from clause and note the estimated bytes. Now change the table in the from clause to the partitioned table you >created for question 5 and note the estimated bytes processed. What are these values?
>
>Choose the answer which most closely matches.
> 
>- 12.47 MB for non-partitioned table and 326.42 MB for the partitioned table
>- 310.24 MB for non-partitioned table and 26.84 MB for the partitioned table
>- 5.87 MB for non-partitioned table and 0 MB for the partitioned table
>- 310.31 MB for non-partitioned table and 285.64 MB for the partitioned table

## Setup:

Create a partitioned and clustered table by using the below SQL query:

```SQL
CREATE OR REPLACE TABLE
  `totallyawesometaxidataset.ny_taxi_2024_data_partitioned`
PARTITION BY
  DATE(tpep_dropoff_datetime)
CLUSTER BY
  VendorID AS
SELECT
  *
FROM
  `totallyawesometaxidataset.ny_taxi_2024_data` ;
```

## Solution:
Highlight each of the following SQL queries:

```SQL
-- Query 1
SELECT
  DISTINCT(VendorID)
FROM
  `totallyawesometaxidataset.ny_taxi_2024_data`
WHERE
  DATE(tpep_dropoff_datetime) BETWEEN '2024-03-01'
  AND '2024-03-15';

-- Query 2
SELECT
  DISTINCT(VendorID)
FROM
  `totallyawesometaxidataset.ny_taxi_2024_data_partitioned`
WHERE
  DATE(tpep_dropoff_datetime) BETWEEN '2024-03-01'
  AND '2024-03-15'
```

## Result:
Query 1:

![result 1](result_1.png)

Query 2:

![result 2](result_2.png)
