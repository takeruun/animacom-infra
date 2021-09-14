data "aws_caller_identity" "user" {}

data "template_file" "container_definitions" {
  template = file("container_definitions.json")

  vars = {
    account_id            = local.account_id
    rds_host              = data.terraform_remote_state.rds.outputs.db_address
    rds_username          = var.rds_username
    rds_password          = var.rds_password
    rds_db_name           = var.rds_db_name
    s3_image_bucket       = data.terraform_remote_state.s3_images.outputs.bucket_name
    s3_asset_host         = "https://image.${var.domain}"
    aws_access_key_id     = var.s3_user_aws_access_key_id
    aws_secret_access_key = var.s3_user_aws_secret_access_key
    redis_url             = "redis://${data.terraform_remote_state.redis.outputs.redis_url}:6379"

    master_key = var.master_key
  }
}

# AmazonECSTaskExecutionRolePolicy の参照
data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

#「AmazonECSTaskExecutionRolePolicy」ロールを継承したポリシードキュメントの定義
data "aws_iam_policy_document" "ecs_task_execution" {
  source_json = data.aws_iam_policy.ecs_task_execution_role_policy.policy

  statement {
    effect    = "Allow"
    actions   = ["ssm:GetParameters", "kms:Decrypt"]
    resources = ["*"]
  }
}
