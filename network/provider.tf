terraform {
  backend "s3" {
    key     = "network.tfstate"
    encrypt = true
    region  = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
