variable "app_name" {}

variable "rds_db_name" {}

variable "rds_username" {}

variable "rds_password" {}

variable "bucket" {}

variable "master_key" {}

variable "domain" {}

variable "s3_user_aws_access_key_id" {}

variable "s3_user_aws_secret_access_key" {}

variable "containers_name" {
  default = ["animacom_server", "animacom_api"]
}

variable "aws_region" {
  default = "ap-northeast-1"
}

variable "aws_profile" {
  default     = "default"
  description = "AWS CLI's profile"
}
