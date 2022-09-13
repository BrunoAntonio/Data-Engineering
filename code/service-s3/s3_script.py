import boto3
from botocore.exceptions import ClientError
import pandas as pd

AWS_REGION = 'us-east-1'
AWS_PROFILE = 'localstack'
LOCALSTACK_ENDPOINT_URL = 'http://localhost:4566'
AWS_ACCESS_KEY_ID = ''
AWS_SECRET_ACCESS_KEY = ''

boto3.setup_default_session(profile_name=AWS_PROFILE)
s3 = boto3.resource("s3", region_name=AWS_REGION, endpoint_url=LOCALSTACK_ENDPOINT_URL, aws_access_key_id=AWS_ACCESS_KEY_ID, aws_secret_access_key=AWS_SECRET_ACCESS_KEY)

create_bucket = s3.create_bucket(Bucket='user-uploads') # create S3 bucket

def load_and_update_file():
    # get all buckets
    for bucket in s3.buckets.all():
        print(bucket.name)

    s3.Bucket('user-uploads').upload_file(Filename='../datasets/iris.csv', Key='iris_data.csv') # upload file to bucket

    # get all files in the bucket
    for obj in s3.Bucket('user-uploads').objects.all():
        print(obj)

    # load file from the bucket
    obj = s3.Bucket('user-uploads').Object('iris_data.csv').get()
    df = pd.read_csv(obj['Body'], index_col=0)
    print(df.head())

if __name__ == "__main__":
    load_and_update_file()