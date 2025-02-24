## Homework solutions - Week 3

### Data warehousing

### Setup - Step 1:
Download the required data and then upload it to GCS via [script.py](script.py)


### Setup - Step 2:
Create the necessary tables as follows:

``` SQL
create or replace external table totallyawesometaxidataset.ny_taxi_2024_data_external
options (
    format = 'PARQUET',
    uris = ['gs://totallyawesometaxibucket/yellow_tripdata_2024-*.parquet']
);

create table totallyawesometaxidataset.ny_taxi_2024_data as( 
    select 
        *
    from totallyawesometaxidataset.ny_taxi_2024_data_extenal
);
```
### Solutions

* Solution to [Question 1](question_1)

* Solution to [Question 2](question_2)

* Solution to [Question 3](question_3)

* Solution to [Question 4](question_4)

* Solution to [Question 5](question_5)

* Solution to [Question 6](question_6)

* Solution to [Question 7](question_7)