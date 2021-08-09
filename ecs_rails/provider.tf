provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  backend "s3" {
    key     = "ecs_rails.tfstate"
    encrypt = true
    region  = "ap-northeast-1"
  }
}
