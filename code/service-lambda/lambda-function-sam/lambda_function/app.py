import json
import pandas as pd

def lambda_handler(event, context):
    
    data = ["Ana", "Ana1"]
    df = pd.DataFrame(data)
    
    first_name = event['firstname']
    last_name = event['lastname']

    ana = data[0]
    ana1 = data[1]

    return {
        'statusCode': 200,
        'body': json.dumps(f'Hello {first_name} {last_name} {ana} {ana1}')
    }
