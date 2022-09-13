import boto3

def scan_movie_table():

    dynamodb = boto3.resource('dynamodb', endpoint_url="http://localhost:8000")
    table = dynamodb.Table('Movies')

    response = table.scan()
    data = response['Items']

    while 'LastEvaluatedKey' in response:
        response = table.scan(ExclusiveStartKey=response['LastEvaluatedKey'])
        data.extend(response['Items'])

    return response

if __name__ == '__main__':
    response = scan_movie_table()
    
    for item in response['Items']:
        print(item,'\n')
    
