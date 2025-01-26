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

def create_df(file):
    df = pd.read_csv(file, dtype=dtypes)
    return df

def ingest_data(df, params, engine):
    print("Starting data ingestion...")
    start_time = time()
    df.to_sql(name=f"{params.table}", con=engine, if_exists="append", index=False)
    end_time = time()
    print("Data ingested after %.3f seconds." % (end_time - start_time))


filename = "data.csv"
dtypes = {"LocationID":"int64","Borough":"object","Zone":"object","service_zone":"object"}
parser = argparse.ArgumentParser(description="Ingest CSV data to Postgres")
add_parser_args(parser)
args = parser.parse_args()
download_csv(args)
ingest_data(create_df(filename), args, create_connection_engine(args))