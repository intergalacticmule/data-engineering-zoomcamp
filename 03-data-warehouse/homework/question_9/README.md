## Question 9

>Write a ```SELECT count(*)``` query FROM the materialized table you created. How many bytes does it estimate will be read? Why?

## Solution:
The query estimates 0 MB will be read. This is due to the table being a materialized table. As such, BigQuery stores metadata related to it, and one such instance of metadata is number of rows.


