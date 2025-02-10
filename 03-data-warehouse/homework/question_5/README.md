## Question 5

> What is the best strategy to make an optimized table in Big Query if your query will always filter based on tpep_dropoff_datetime and order the results by VendorID (Create a new table with this strategy)
> 
>- Partition by tpep_dropoff_datetime and Cluster on VendorID
>- Cluster on by tpep_dropoff_datetime and Cluster on VendorID
>- Cluster on tpep_dropoff_datetime Partition by VendorID
>- Partition by tpep_dropoff_datetime and Partition by VendorID

## Solution:
> Partition by tpep_dropoff_datetime and Cluster on VendorID
