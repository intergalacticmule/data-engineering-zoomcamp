FROM python:3.9

RUN apt-get install wget
RUN pip install pandas sqlalchemy psycopg2

WORKDIR /app

COPY ingest_green_trip_data.py ./

ENTRYPOINT ["python", "ingest_green_trip_data.py"]