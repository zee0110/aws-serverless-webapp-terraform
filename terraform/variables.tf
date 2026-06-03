variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-southeast-2" # Sydney
}

variable "project_name" {
  description = "Project name, used as a prefix for resource names"
  type        = string
  default     = "serverless-webapp"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "bucket_suffix" {
  description = "Unique suffix for the S3 bucket name (must be globally unique)"
  type        = string
  default     = "demo1234"
}
