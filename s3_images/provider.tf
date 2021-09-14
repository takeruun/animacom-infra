terraform {
  backend "s3" {
    key     = "s3_images.tfstate"
    encrypt = true
    region  = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
