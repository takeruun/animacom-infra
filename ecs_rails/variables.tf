variable "app_name" {}

variable "rds_db_name" {}

variable "rds_username" {}

variable "rds_password" {}

variable "bucket" {}

variable "master_key" {}

variable "containers_name" {
  default = ["nginx", "rails"]
}

variable "aws_region" {
  default = "ap-northeast-1"
}

variable "aws_profile" {
  default     = "default"
  description = "AWS CLI's profile"
}
