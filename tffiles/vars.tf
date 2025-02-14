variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type = string
}

resource "random_string" "name" {
  length  = 5
  upper   = false
  lower   = true
  special = false
}

locals {
  vpc_name     = "eks-wakaran-handson-vpc"
  cluster_name = "eks-wakaran-handson-cluster"
  ecr_name     = "eks-wakaran-handson-ecr"
  s3_name     = "eks-wakaran-handson-s3-${random_string.name.result}"
}