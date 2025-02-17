provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = "handson"
      Project     = "eks-wakaran"
      Terraform   = "true"
    }
  }
}