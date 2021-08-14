data "aws_caller_identity" "user" {}

data "template_file" "container_definitions" {
  template = file("container_definitions.json")

  vars = {
    account_id            = local.account_id
    rds_host              = data.terraform_remote_state.rds.outputs.db_address
    rds_username          = var.rds_username
    rds_password          = var.rds_password
    rds_db_name           = var.rds_db_name
    s3_image_bucket       = "s3_image_bucket"
    s3_asset_host         = "http://s3_asset_host"
    aws_access_key_id     = "aws_access_key_id"
    aws_secret_access_key = "aws_secret_access_key"
    redis_url             = "http://redis_url"

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
