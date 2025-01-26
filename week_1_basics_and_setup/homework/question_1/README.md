## Solution to question 1

### Step 1: 
Create [Dockerfile](Dockerfile) with python version and entrypoint

### Step 2: 
Build image using Dockerfile:

_docker build -t python:3.12.8 ._

### Step 3: 
Start container from image:

_docker run -it python:3.12.8_

### Step 4: 
Check pip version once the container is up:

_#pip --version_

>_pip 24.3.1 from /usr/local/lib/python3.12/site-packages/pip (python 3.12)_

### Final result:
The correct answer is thus _24.3.1_