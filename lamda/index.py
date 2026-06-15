def lambda_handler(event, context):
    # Lambda handler for URL shortening service
    return {
        "statusCode": 200,
        "body": "URL Shortener Lambda working!"
    }
