## Question 2 

>What is the rendered value of the variable file when the inputs taxi is set to green, year is set to 2020, and month is set to 04 during execution?
>- {{inputs.taxi}}_tripdata_{{inputs.year}}-{{inputs.month}}.csv
>- green_tripdata_2020-04.csv
>- green_tripdata_04_2020.csv
>- green_tripdata_2020.csv

## Solution:

Considering the below variable:
```yaml
variables:
  file: "{{inputs.taxi}}_tripdata_{{inputs.year}}-{{inputs.month}}.csv"
```
We can see that it is generated dynamically based on the input selections when executing the workflow. The first dynamic value contains the type of taxi (_green or yellow_), passed dynamically depending on the choice before execution, followed by a static "_tripdata_" string, followed by dynamic passing of the execution date in _yyyy-MM_ format, followed by a static "_.csv_" string.

### Final result:

green_tripdata_2020-04.csv


