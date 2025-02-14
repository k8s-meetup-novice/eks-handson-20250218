resource "aws_s3_bucket" "sample" {
  bucket = local.s3_name
}