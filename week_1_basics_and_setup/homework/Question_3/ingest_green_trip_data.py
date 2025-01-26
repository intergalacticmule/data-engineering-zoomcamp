import pandas as pd
from sqlalchemy import create_engine
from time import time
import argparse
import os

def add_parser_args(parser):
    parser.add_argument("--username", help="Username for Postgres")
    parser.add_argument("--password", help="Password for Postgres")
    parser.add_argument("--host", help="Host of Postgres")
    parser.add_argument("--port", help="Port of Postgres")
    parser.add_argument("--db", help="Database in Postgres")
    parser.add_argument("--table", help="Table in Postgres")
    parser.add_argument("--url", help="Url of the CSV source file")

def download_csv(params):
    os.system(f"wget {params.url} -O {filename}")

def create_connection_engine(params):
    engine = create_engine(f"postgresql://{params.username}:{params.password}@{params.host}:{params.port}/{params.db}")
    engine.connect()
    print("Connection to Postgres database successful.")
    return engine

def create_iter_df(file):
    df_iter = pd.read_csv(file, iterator=True, chunksize=100000, dtype=dtypes, parse_dates=["lpep_pickup_datetime", "lpep_dropoff_datetime"])
    return df_iter

def ingest_data(df_iter, params, engine):
    print("Starting data ingestion...")
    while True:
        try:
            start_time = time()
            df = next(df_iter)
            df.to_sql(name=f"{params.table}", con=engine, if_exists="append", index=False)
            end_time = time()
            print("Chunk ingested after %.3f seconds." % (end_time - start_time))
        except:
            print("No more chunks to ingest. Shutting down.")
            break

filename = "data.csv.gz"
dtypes = {"VendorID":"float64","passenger_count":"float64","trip_distance":"float64","RatecodeID":"float64","store_and_fwd_flag":"object","PULocationID":"int64","DOLocationID":"int64","payment_type":"float64","fare_amount":"float64","extra":"float64","mta_tax":"float64","tip_amount":"float64","tolls_amount":"float64","improvement_surcharge":"float64","total_amount":"float64","congestion_surcharge":"float64"}
parser = argparse.ArgumentParser(description="Ingest CSV data to Postgres")
add_parser_args(parser)
args = parser.parse_args()
download_csv(args)
ingest_data(create_iter_df(filename), args, create_connection_engine(args))