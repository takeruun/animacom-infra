terraform {
  backend "s3" {
    key     = "spa.tfstate"
    encrypt = true
    region  = "ap-northeast-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
