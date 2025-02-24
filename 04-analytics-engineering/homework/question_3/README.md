## Question 3

Considering the data lineage below and that taxi_zone_lookup is the **only** materialization build (from a .csv seed file):

![graph](homework_q2.png)

Select the option that does **NOT** apply for materializing `fct_taxi_monthly_zone_revenue`:

- >dbt run
- >dbt run --select +models/core/dim_taxi_trips.sql+ --target prod
- >dbt run --select +models/core/fct_taxi_monthly_zone_revenue.sql
- >dbt run --select +models/core/
- >dbt run --select models/staging/+

## Solution:
```shell
dbt run --select +models/core/dim_taxi_trips.sql+ --target prod
```