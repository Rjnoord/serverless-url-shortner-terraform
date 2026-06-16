import json
import boto3
import os
import random
import string

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])

def generate_code(length=6):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

def lambda_handler(event, context):
    body = json.loads(event.get("body", "{}"))
    long_url = body.get("url")

    if not long_url:
        return {
            "statusCode": 400,
            "body": json.dumps({"error": "Missing url"})
        }

    short_code = generate_code()

    table.put_item(
        Item={
            "short_code": short_code,
            "long_url": long_url
        }
    )

    return {
        "statusCode": 200,
        "body": json.dumps({
            "short_code": short_code,
            "long_url": long_url
        })
    }