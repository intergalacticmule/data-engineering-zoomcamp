import os
import json
from urllib.request import urlretrieve
from google.cloud import storage
from oauth2client.service_account import ServiceAccountCredentials

creds = "keys/my-creds.json"
bucket_name = "totallyawesometaxibucket"
client = storage.Client.from_service_account_json(creds)
bucket = client.get_bucket(bucket_name)

for month in range (1, 7):
    url = f"https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-0{month}.parquet"
    filename = url.split("/")[-1]
    try:
        print(f"Downloading file {filename} from source...")
        urlretrieve(url, filename)
        print(f"File {filename} downloaded successfully.")
    except:
        raise Exception(f"Failed to download file {filename} from source.")
    print(f"Uploading file {filename} to bucket {bucket_name}...")
    blob = bucket.blob(filename)
    blob.upload_from_filename(filename)
    if storage.Blob(bucket=bucket, name=filename).exists(client):
        print(f"File {filename} uploaded to bucket {bucket_name} successfully.")
    else:
        raise Exception(f"Failed to upload file {filename} to bucket {bucket_name}.")
    os.remove(filename)