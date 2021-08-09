data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = var.bucket
    key    = "network.tfstate"
    region = "ap-northeast-1"
  }
}
