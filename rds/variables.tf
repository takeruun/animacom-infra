variable "app_name" {}

variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "8.0.20"
}

variable "db_instance" {
  type    = string
  default = "db.t2.micro"
}

variable "db_name" {}

variable "db_username" {}

variable "db_password" {}

variable "bucket" {}

variable "aws_region" {
  default = "ap-northeast-1"
}

variable "aws_profile" {
  default     = "default"
  description = "AWS CLI's profile"
}
