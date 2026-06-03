output "api_endpoint" {
  description = "Base URL of the HTTP API"
  value       = aws_apigatewayv2_api.http_api.api_endpoint
}

output "cloudfront_domain" {
  description = "CloudFront distribution domain for the frontend"
  value       = aws_cloudfront_distribution.frontend.domain_name
}

output "dynamodb_table" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.app_table.name
}
