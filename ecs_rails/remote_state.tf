data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = var.bucket
    key    = "network.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "rds" {
  backend = "s3"

  config = {
    bucket = var.bucket
    key    = "rds.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"

  config = {
    bucket = var.bucket
    key    = "alb.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "redis" {
  backend = "s3"

  config = {
    bucket = var.bucket
    key    = "redis.tfstate"
    region = "ap-northeast-1"
  }
}


data "terraform_remote_state" "s3_images" {
  backend = "s3"

  config = {
    bucket = var.bucket
    key    = "s3_images.tfstate"
    region = "ap-northeast-1"
  }
}
