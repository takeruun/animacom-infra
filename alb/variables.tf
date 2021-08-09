variable "app_name" {}

variable "ingress_ports" {
  description = "list of ingress ports"
  default     = [80, 443]
}

variable "domain" {}

variable "bucket" {}

variable "aws_region" {
  default = "ap-northeast-1"
}

variable "aws_profile" {
  default     = "default"
  description = "AWS CLI's profile"
}
