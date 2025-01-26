## Solution to question 7

### Step 1:
Initialize working directory

_terraform init_
### Step 2:
Create execution plan proposed in [main.tf](main.tf):

_terraform plan_

### Step 3:
Apply proposed plan from [Step 2](#step-2) without confirmation:

_terraform apply -auto-approve_

### Step 4:
Log into GCP Console and verify that the proposed infrastructure is set up (Storage Bucket and BigQuery dataset)

### Step 5:
Destroy all remote objects managed by the current Terraform configuration:

_terraform destroy_

### Final result:

The correct answer is thus _terraform init, terraform apply -auto-approve, terraform destroy_