resource "aws_ecr_repository" "novice-ecr" {
  name = local.ecr_name
  image_tag_mutability = "MUTABLE"

  tags = {
    Name = local.ecr_name
  }
}