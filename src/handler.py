"""
Lambda handler for the serverless web app API.
Routes:
  GET  /items  -> list items from DynamoDB
  POST /items  -> add an item to DynamoDB
"""
import json
import os
import uuid
import boto3

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])


def lambda_handler(event, context):
    method = event.get("requestContext", {}).get("http", {}).get("method", "GET")

    if method == "POST":
        body = json.loads(event.get("body") or "{}")
        item = {"id": str(uuid.uuid4()), "name": body.get("name", "unnamed")}
        table.put_item(Item=item)
        return _response(201, item)

    # default: GET /items
    result = table.scan()
    return _response(200, result.get("Items", []))


def _response(status, payload):
    return {
        "statusCode": status,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(payload),
    }
