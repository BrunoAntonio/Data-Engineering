import boto3
from boto3.dynamodb.conditions import Key

def get_movies():
    dynamodb = boto3.resource('dynamodb', endpoint_url="http://localhost:8000")
    table = dynamodb.Table('Movies')

# Get a Single Item
    response = table.get_item(
        Key={
        'year': 2013,
        'title': 'Rush'
        }
    )
    print(response['Item'])

# Query for Items Matching a Partition Key
    response = table.query(
    KeyConditionExpression=Key('year').eq(2013)  & Key('title').begins_with('T')
    )

    for item in response['Items']:
            print(item,'\n')

    # Hask key == 2013 and Range key <= B
    response = table.query(
    KeyConditionExpression=Key('year').eq(2013)  & Key('title').lte('B')
    )

    for item in response['Items']:
            print(item,'\n')

    # Hask key == 2013 and Range key between A and B
    response = table.query(
    KeyConditionExpression=Key('year').eq(2013)  & Key('title').between('A','B')
    )

    for item in response['Items']:
            print(item,'\n')


if __name__ == '__main__':
    get_movies()
