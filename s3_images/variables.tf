locals {
  bucket_name  = "${var.app_name}-s3-images"
  s3_origin_id = "S3-Images-${var.app_name}"
}

variable "app_name" {}

variable "domain" {}
