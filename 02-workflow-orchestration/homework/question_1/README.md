## Question 1 

>Within the execution for Yellow Taxi data for the year 2020 and month 12: what is the uncompressed file size (i.e. the output file _yellow_tripdata_2020-12.csv_ of the extract task)?
>- 128.3 MB
>- 134.5 MB
>- 364.7 MB
>- 692.6 MB

## Solution:

### Step 1: Disable task purge_files inside the flow to be able to inspect output file size

### Step 2: Trigger workflow backfill for the yellow taxi data of 2020-12

### Step 3: Inspect the output file by navigating to the executions log and selecting the "extract" task's output

### Final result:
>128.3MB