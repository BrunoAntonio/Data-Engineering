import boto3
from decimal import Decimal

def update_movies():

    dynamodb = boto3.resource('dynamodb', endpoint_url="http://localhost:8000")
    table = dynamodb.Table('Movies')

    response = table.update_item(
        Key={
            'year': 2013,
            'title': 'Rush'
            },
        UpdateExpression='SET directors = :newDirector, genres = :newGenres, rating = :newRating',
        ConditionExpression='attribute_exists(directors) AND attribute_exists(genres)',
        ExpressionAttributeValues={
            ':newDirector': "Bruno",
            ':newGenres':["Acão, Drama"],
            ':newRating': Decimal("9.8")
        },
        ReturnValues="UPDATED_NEW"
)

    return table

if __name__ == '__main__':

    table = update_movies()
    response = table.get_item(
            Key={
            'year': 2013,
            'title': 'Rush'
            }
        )
    print(response['Item'])